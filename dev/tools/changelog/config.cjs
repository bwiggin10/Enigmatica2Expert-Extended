// @ts-check

const { execSync } = require('node:child_process')
const { readFileSync, existsSync } = require('node:fs')
const { resolve } = require('node:path')

const { parse } = require('yaml')

/**
 * @param {string} command
 */
function execSyncInherit(command) {
  return execSync(command, { stdio: 'inherit' })
}

function capitalize(str) {
  return str.replace(/(^[\s\p{Emoji}]*?)(\w)/u, (m, r1, r2) => r1 + r2.toLocaleUpperCase())
}

/**
 * @typedef Config
 * @type {object}
 * @property {Record<string, string>} renames
 * @property {Record<string, string>} discardable
 * @property {Record<string, string>} scopes
 * @property {string} defaultAuthor
 */

/** @type {Config} */
const config = parse(readFileSync(resolve(__dirname, 'config.yml'), 'utf8'))

/** @type {import('../../../node_modules/@types/conventional-changelog-core/index.d.ts').WriterOptions} */
const writerOpts = {
  transform(_commit, context) {
    const commit = {}
    for (const propName of Object.keys(_commit)) {
      commit[propName] = _commit[propName]
    }

    let discard = true
    const issues = []

    // Handle breaking
    commit.notes.forEach((note) => {
      note.title = 'BREAKING CHANGES'
      discard = false
    })

    // Rename types
    const newType = config.renames[commit.type]
      ?? (commit.revert ? 'Reverts' : undefined)

    // This is discardable commit type
    if (!newType && discard && config.discardable[commit.type]) return false

    commit.type = newType

    if (commit.scope === '*') commit.scope = ''

    if (typeof commit.scope === 'string') {
      commit.scope = config.scopes[commit.scope.toLocaleLowerCase()]
        ?? capitalize(commit.scope)
    }

    if (typeof commit.hash === 'string')
      commit.shortHash = commit.hash.substring(0, 7)

    // Transform body images
    if (typeof commit.body === 'string') {
      const images = []
      commit.body = commit.body.replace(
        /(^|\s+)(!\[[^\]]*\]\()?(?<link>(http)?s?:?(\/\/[^"'\s]*?\.(?:png|jpg|jpeg|gif|svg)))\)?($|\s+)/gm,
        (m, ...args) => {
          const g = args.pop()
          images.push(g.link)
          return ''
        }
      )
      if (images.length) /** @type {any} */ commit.images = images.reverse()
    }

    // Add new "description" field that actually both bod + footer with indentation
    if (typeof commit.body === 'string' || typeof commit.footer === 'string') {
      /** @type {any} */ commit.description
        = `${commit.body ?? ''}${commit.footer ? `\n\n${commit.footer}` : ''}`.trim().split('\n')
    }

    // Create issue urls
    if (typeof commit.subject === 'string') {
      let url = context.repository
        ? `${context.host}/${context.owner}/${context.repository}`
        : context.repoUrl
      if (url) {
        url = `${url}/issues/`
        // Issue URLs.
        commit.subject = commit.subject.replace(/#(\d+)/g, (_, issue) => {
          issues.push(issue)
          return `[#${issue}](${url}${issue})`
        })
      }
      if (context.host) {
        // User URLs.
        commit.subject = commit.subject.replace(/\B@([a-z0-9](?:-?[a-z0-9/]){0,38})/g, (_, username) => {
          if (username.includes('/'))
            return `@${username}`

          return `[@${username}](${context.host}/${username})`
        })
      }

      commit.subject = capitalize(commit.subject)
    }
    if (typeof commit.header === 'string')
      commit.header = capitalize(commit.header)

    // remove references that already appear in the subject
    commit.references = commit.references.filter((reference) => {
      if (!issues.includes(reference.issue))
        return true

      return false
    })

    if (commit.authorName
      && commit.authorEmail
      && commit.authorEmail !== config.defaultAuthor
    ) {
      /** @type {any} */ commit.isContribution = true

      const sanitized = commit.authorName
        .trim()
        .toLowerCase()
        .replace(/[^a-z0-9-]/g, '')

      commit.authorUrl = `https://github.com/${sanitized}`
    }

    return commit
  },

  // eslint-disable-next-line unused-imports/no-unused-vars
  finalizeContext(context, options, commits, keyCommit) {
    context.modschanges = getModChanges()

    context.commitGroups.forEach((g) => {
      if (!g.title) g.title = 'Misc'

      const groupedBy = {}

      g.commits.forEach((c) => {
        (groupedBy[c.scope || ''] ??= []).push(c)
      })

      // @ts-expect-error nonoptional
      delete g.commits

      /** @type {any} */ g.scopes = Object.entries(groupedBy)
        .map(([scope, commits]) => ({ scope, commits }))
    })

    context.version = readFileSync('dev/version.txt', 'utf8').trim()

    return context
  },
  groupBy         : 'type',
  commitGroupsSort: 'title',
  // commitGroupsSort: (a, b) => {
  //   const commitGroupOrder = ['Reverts', 'Performance Improvements', 'Bug Fixes', 'Features']
  //   const gRankA = commitGroupOrder.indexOf(a.title || '')
  //   const gRankB = commitGroupOrder.indexOf(b.title || '')
  //   return gRankA >= gRankB ? -1 : 1
  // },
  commitsSort     : ['scope', 'subject'],
  noteGroupsSort  : 'title',
  // notesSort       : compareFunc,
}

addTemplate('template', 'mainTemplate')
;['commit', 'footer', 'header'].forEach(f => addTemplate(f, `${f}Partial`))

function addTemplate(fileName, templateName) {
  const filePath = resolve(__dirname, `templates/${fileName}.hbs`)
  if (existsSync(filePath))
    writerOpts[templateName] = readFileSync(filePath, 'utf8')
}

////////////////////////////////////////////////////////////////////////

function getModChanges() {
  const old_version = execSync('git describe --tags --abbrev=0').toString().trim()

  // Extract old mcinstance
  execSyncInherit(`git show tags/${old_version}:minecraftinstance.json > minecraftinstance_old.json`)

  execSyncInherit(
    'tsx mc-tools/packages/modlist/src/cli.ts'
    + ' --old=minecraftinstance_old.json'
    + ' --ignore=dev/.devonly.ignore'
    + ' --key=secrets/~cf_api_key.txt'
    + ' --template=dev/tools/changelog/modlist.md'
    + ' --output=~mods_changes.md'
  )

  return readFileSync('~mods_changes.md', 'utf8')
}

////////////////////////////////////////////////////////////////////////

function addBangNotes(commit) {
  const match = commit.header.match(/^(\w*)(?:\((.*)\))?!: (.*)$/)
  if (match && commit.notes.length === 0) {
    const noteText = match[3] // the description of the change.
    commit.notes.push({
      text: noteText,
    })
  }
}

/** @type {import('../../../node_modules/@types/conventional-changelog-core/index.d.ts').ParserOptions} */
const parserOpts = {
  headerPattern       : /^(\w*)(?:\((.*)\))?!?: (.*)$/,
  // breakingHeaderPattern: /^(\w*)(?:\((.*)\))?!: (.*)$/,
  headerCorrespondence: ['type', 'scope', 'subject'],
  noteKeywords        : ['BREAKING CHANGE', 'BREAKING-CHANGE'],
  revertPattern       : /^(?:Revert|revert:)\s"?([\s\S]+?)"?\s*This reverts commit (\w*)\./i,
  revertCorrespondence: ['header', 'hash'],
  // issuePrefixes        : config.issuePrefixes,
}

/** @type {import('../../../node_modules/@types/conventional-changelog-core/index.d.ts').Options.Config} */
const exportConfig = {
  gitRawCommitsOpts: {
    format: '%B%n-hash-%n%H%n-gitTags-%n%d%n-committerDate-%n%ci%n-authorName-%n%an%n-authorEmail-%n%ae%n-gpgStatus-%n%G?%n-gpgSigner-%n%GS',
  },
  writerOpts,
  parserOpts,
  recommendedBumpOpts: {
    whatBump: (commits) => {
      let level = 2
      let breakings = 0
      let features = 0

      commits.forEach((commit) => {
        // adds additional breaking change notes
        // for the special case, test(system)!: hello world, where there is
        // a '!' but no 'BREAKING CHANGE' in body:
        addBangNotes(commit)
        if (commit.notes.length > 0) {
          breakings += commit.notes.length
          level = 0
        }
        else if (commit.type === 'feat' || commit.type === 'feature') {
          features += 1
          if (level === 2)
            level = 1
        }
      })

      // @ts-expect-error preMajor
      if (config.preMajor && level < 2) level++

      return {
        level,
        reason: breakings === 1
          ? `There is ${breakings} BREAKING CHANGE and ${features} features`
          : `There are ${breakings} BREAKING CHANGES and ${features} features`,
      }
    },
  },
}

module.exports = exportConfig
