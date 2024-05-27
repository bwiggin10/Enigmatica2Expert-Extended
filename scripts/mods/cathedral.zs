#modloaded cathedral

// [Stone Pillar]*4 from [Stone]
craft.remake(<cathedral:cathedral_pillar_various> * 4, ['pretty',
  '    s',
  '    s',
  '    s'], {
  's': <ore:stone>, // Stone
});

// [Basalt Pillar]*4 from [Basalt]
craft.remake(<cathedral:cathedral_pillar_various:11> * 4, ['pretty',
  '    B',
  '    B',
  '    B'], {
  'B': <ore:stoneBasalt>, // Basalt
});

// [Marble Pillar]*4 from [Marble]
craft.remake(<cathedral:cathedral_pillar_various:9> * 4, ['pretty',
  '    M',
  '    M',
  '    M'], {
  'M': <ore:stoneMarble>, // Marble
});

// [Limestone Pillar]*4 from [Limestone]
craft.remake(<cathedral:cathedral_pillar_various:10> * 4, ['pretty',
  '    L',
  '    L',
  '    L'], {
  'L': <ore:stoneLimestone>, // Limestone
});
