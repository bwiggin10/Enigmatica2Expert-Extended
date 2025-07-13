/*

Set reworked IC2 dusts new names.
For some reason, this cant be done with Resource Loader.

*/

#priority 4000

val localizationMap as string[string][string] = {
  en_us: {
    'ic2.dust.coal'            : 'Blackened Fruit',
    'ic2.dust.ender_pearl'     : 'Spectral Fruit',
    'ic2.dust.small_tin'       : 'Tiny Fruit',
    'ic2.dust.small_copper'    : 'Coppery Fruit',
    'ic2.dust.small_diamond'   : 'Gelided Fruit',
    'ic2.dust.small_gold'      : 'Golden Fruit',
    'ic2.dust.small_iron'      : 'Irony Fruit',
    'ic2.dust.small_lead'      : 'Leaden Fruit',
    'ic2.dust.small_silver'    : 'Silvery Fruit',
    'ic2.dust.sulfur'          : 'Fiery Fruit',
    'ic2.crop_res.coffee_beans': 'Arabica',
  },

  ru_ru: {
    'ic2.dust.coal'            : 'Почерневший фрукт',
    'ic2.dust.ender_pearl'     : 'Спектральный фрукт',
    'ic2.dust.small_tin'       : 'Оловяный фрукт',
    'ic2.dust.small_copper'    : 'Медный фрукт',
    'ic2.dust.small_diamond'   : 'Желированный фрукт',
    'ic2.dust.small_gold'      : 'Золотой фрукт',
    'ic2.dust.small_iron'      : 'Железный фрукт',
    'ic2.dust.small_lead'      : 'Свинцовый фрукт',
    'ic2.dust.small_silver'    : 'Серебристый фрукт',
    'ic2.dust.sulfur'          : 'Огневой фрукт',
    'ic2.crop_res.coffee_beans': 'Арабика',
  },

  zh_cn: {
    'ic2.dust.coal'            : '焦黑果',
    'ic2.dust.ender_pearl'     : '幽灵果',
    'ic2.dust.small_tin'       : '微小果',
    'ic2.dust.small_copper'    : '铜质果',
    'ic2.dust.small_diamond'   : '冰冷果',
    'ic2.dust.small_gold'      : '金质果',
    'ic2.dust.small_iron'      : '铁质果',
    'ic2.dust.small_lead'      : '铅质果',
    'ic2.dust.small_silver'    : '银质果',
    'ic2.dust.sulfur'          : '火热果',
    'ic2.crop_res.coffee_beans': '阿拉比卡',
  },
};

for lang, entries in localizationMap {
  for k, v in entries {
    game.setLocalization(lang, k, v);
  }
}
