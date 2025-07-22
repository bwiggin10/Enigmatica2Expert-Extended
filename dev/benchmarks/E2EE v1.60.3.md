## Minecraft load time benchmark

---

<p align="center" style="font-size:160%;">
MC total load time:<br>
218 sec
<br>
<sup><sub>(
3:38 min
)</sub></sup>
</p>

<br>
<!--
Note for image scripts:
  - Newlines are ignored
  - This characters cant be used: +<"%#
-->
<p align="center">
<img src="https://quickchart.io/chart.png?w=400&h=60&c={
  type: 'horizontalBar',
  data: {
    datasets: [
        {label: 'Mixins\n', data: [21.00]},
        {label: 'Construction\n', data: [42.00]},
        {label: 'PreInit\n', data: [109.00]},
        {label: 'Init\n', data: [43.00]},
    ]
  },
  options: {
    layout: { padding: { top: 10 } },
    scales: {
      xAxes: [{display: false, stacked: true}],
      yAxes: [{display: false, stacked: true}],
    },
    elements: {rectangle: {borderWidth: 2}},
    legend: {display: false},
    plugins: {datalabels: {
      color: 'white',
      font: {
        family: 'Consolas',
      },
      formatter: (value, context) =>
        [context.dataset.label, value, 's'].join('')
    }},
    annotation: {
      clip: false,
      annotations: [{
          type: 'line',
          scaleID: 'x-axis-0',
          value: 21,
          borderColor: 'black',
          label: {
            content: 'Window appear',
            fontSize: 8,
            enabled: true,
            xPadding: 8, yPadding: 2,
            yAdjust: -20
          },
        }
      ]
    },
  }
}"/>
</p>

<br>

# Mods Loading Time

<p align="center">
<img src="https://quickchart.io/chart.png?w=400&h=300&c={
  type: 'outlabeledPie',
  options: {
    rotation: Math.PI,
    cutoutPercentage: 25,
    plugins: {
      legend: !1,
      outlabels: {
        stretch: 5,
        padding: 1,
        text: (v,i)=>[
          v.labels[v.dataIndex],' ',
          (v.percent*1000|0)/10,
          String.fromCharCode(37)].join('')
      }
    }
  },
  data: {...
`
8f304e  5.17s Astral Sorcery;
813e81  4.44s OpenComputers;
a651a8  4.07s IndustrialCraft 2;
516fa8  3.70s Ender IO;
6e5e17  2.83s Tinkers' Antique;
5E5014  2.00s [TCon Textures];
cd922c  2.38s NuclearCraft;
5161a8  2.19s CraftTweaker2;
213664  2.12s Forestry;
308f7e  1.95s Quark: RotN Edition;
ba3eb8  1.94s Cyclic;
3e8160  1.80s The Twilight Forest;
436e17  1.73s Integrated Dynamics;
a86e51  1.48s Extra Utilities 2;
8c2ccd  1.43s Immersive Engineering;
3eb2ba  1.37s Botania;
8f4d30  1.23s Open Terrain Generator;
444444  7.80s 7 Other mods;
333333 36.79s 121 'Fast' mods (1.0s - 0.1s);
222222  8.10s 338 'Instant' mods (%3C 0.1s)
`
    .split(';').reduce((a, l) => {
      l.match(/(\w{6}) *(\d*\.\d*) ?s (.*)/s)
      .slice(1).map((a, i) => [[String.fromCharCode(35),a].join(''), a,
        a.length > 15 ? a.split(/(?%3C=.{9})\s(?=\S{5})/).join('\n') : a
      ][i])
      .forEach((s, i) =>
        [a.datasets[0].backgroundColor, a.datasets[0].data, a.labels][i].push(s)
      );
      return a
    }, {
      labels: [],
      datasets: [{
        backgroundColor: [],
        data: [],
        borderColor: 'rgba(22,22,22,0.3)',
        borderWidth: 1
      }]
    })
  }
}"/>
</p>

<br>

# Loader steps

Show how much time each mod takes on each game load phase.

JEI/HEI not included, since its load time based on other mods and overal item count.

<p align="center">
<img src="https://quickchart.io/chart.png?w=400&h=450&c={
  options: {
    scales: {
      xAxes: [{stacked: true}],
      yAxes: [{stacked: true}],
    },
    plugins: {
      datalabels: {
        anchor: 'end',
        align: 'top',
        color: 'white',
        backgroundColor: 'rgba(46, 140, 171, 0.6)',
        borderColor: 'rgba(41, 168, 194, 1.0)',
        borderWidth: 0.5,
        borderRadius: 3,
        padding: 0,
        font: {size:10},
        formatter: (v,ctx) =>
          ctx.datasetIndex!=ctx.chart.data.datasets.length-1 ? null
            : [((ctx.chart.data.datasets.reduce((a,b)=>a- -b.data[ctx.dataIndex],0)*10)|0)/10,'s'].join('')
      },
      colorschemes: {
        scheme: 'office.Damask6'
      }
    }
  },
  type: 'bar',
  data: {...(() => {
    let a = { labels: [], datasets: [] };
`
0: Construction;
1: Loading Resources;
2: PreInitialization;
3: Initialization;
4: Other
`
    .split(';')
      .map(l => l.match(/\d: (.*)/).slice(1))
      .forEach(([name]) => a.datasets.push({ label: name, data: [] }));
`
                                  0      1      2      3      4;
Astral Sorcery                | 0.19| 0.00| 4.07| 0.90| 0.00;
OpenComputers                 | 0.12| 0.00| 2.96| 1.35| 0.00;
IndustrialCraft 2             | 0.58| 0.00| 3.03| 0.46| 0.00;
Ender IO                      | 1.14| 0.00| 2.36| 0.20| 0.00;
Tinkers' Antique              | 0.73| 0.00| 0.09| 0.01| 2.00;
NuclearCraft                  | 0.04| 0.00| 2.18| 0.15| 0.00;
CraftTweaker2                 | 0.08| 0.00| 2.11| 0.01| 0.00;
Forestry                      | 0.25| 0.00| 1.59| 0.28| 0.00;
Quark: RotN Edition           | 0.02| 0.00| 1.88| 0.05| 0.00;
Cyclic                        | 0.03| 0.00| 1.52| 0.38| 0.00;
[Mod Average]                 | 0.05| 0.00| 0.13| 0.02| 0.00
`
    .split(';').slice(1)
      .map(l => l.split('|').map(s => s.trim()))
      .forEach(([name, ...arr], i) => {
        a.labels.push(name);
        arr.forEach((v, j) => a.datasets[j].data[i] = v)
      }); return a
  })()}
}"/>
</p>

<br>

# TOP JEI Registered Plugis

<p align="center">
<img src="https://quickchart.io/chart.png?w=500&h=200&c={
  options: {
    elements: { rectangle: { borderWidth: 1 } },
    legend: false,
    scales: {
      yAxes: [{ ticks: { fontSize: 9, fontFamily: 'Verdana' }}],
    },
  },
  type: 'horizontalBar',
    data: {...(() => {
      let a = {
        labels: [], datasets: [{
          backgroundColor: 'rgba(0, 99, 132, 0.5)',
          borderColor: 'rgb(0, 99, 132)',
          data: []
        }]
      };
`
 1.48: jeresources.jei.JEIConfig;
 0.58: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
 0.40: crazypants.enderio.machines.integration.jei.MachinesPlugin;
 0.33: com.buuz135.industrial.jei.JEICustomPlugin;
 0.32: ic2.jeiIntegration.SubModule;
 0.28: mezz.jei.plugins.vanilla.VanillaPlugin;
 0.18: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
 0.17: crazypants.enderio.base.integration.jei.JeiPlugin;
 0.15: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
 0.09: net.bdew.jeibees.BeesJEIPlugin;
 0.08: ninjabrain.gendustryjei.GendustryJEIPlugin;
 0.07: thaumicenergistics.integration.jei.ThEJEI;
 1.30: Other
`
        .split(';')
        .map(l => l.split(':'))
        .forEach(([time, name]) => {
          a.labels.push(name);
          a.datasets[0].data.push(time)
        })
        ; return a
    })()
  }
}"/>
</p>

<br>

# FML Stuff

Loading bars that usually not related to specific mods.

⚠️ Shows only steps that took 1.0 sec or more.

<p align="center">
<img src="https://quickchart.io/chart.png?w=500&h=400&c={
  options: {
    rotation: Math.PI*1.125,
    cutoutPercentage: 55,
    plugins: {
      legend: !1,
      outlabels: {
        stretch: 5,
        padding: 1,
        text: (v)=>v.labels
      },
      doughnutlabel: {
        labels: [
          {
            text: 'FML stuff:',
            color: 'rgba(128, 128, 128, 0.5)',
            font: {size: 18}
          },
          {
            text: '124.00s',
            color: 'rgba(128, 128, 128, 1)',
            font: {size: 22}
          }
        ]
      },
    }
  },
  type: 'outlabeledPie',
  data: {...(() => {
    let a = {
      labels: [],
      datasets: [{
        backgroundColor: [],
        data: [],
        borderColor: 'rgba(22,22,22,0.3)',
        borderWidth: 2
      }]
    };
`
001799  2.35s Loading Resource - AssetLibrary;
369900  2.69s Preloading 50813 textures;
2C9900  1.98s Texture loading;
009907  3.80s Posting bake events;
009911 27.01s Setting up dynamic models;
00991C 27.07s Loading Resource - ModelManager;
009982 27.77s Rendering Setup;
000D99 11.14s [VintageFix]: Texture search 68517 sprites;
000399  2.76s Preloaded 33563 sprites;
444444 12.80s Other
`
    .split(';')
      .map(l => l.match(/(\w{6}) *(\d*\.\d*) ?s (.*)/s))
      .forEach(([, col, time, name]) => {
        a.labels.push([
          name.length > 15 ? name.split(/(?%3C=.{11})\s(?=\S{6})/).join('\n') : name
          , ' ', time, 's'
        ].join(''));
        a.datasets[0].data.push(parseFloat(time));
        a.datasets[0].backgroundColor.push([String.fromCharCode(35), col].join(''))
      })
      ; return a
  })()}
}"/>
</p>
