## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
273.35 sec
<br>
<sup><sub>(
4:33 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [110.87]},
      {label: 'FML stuff:', data: [162.48]}
    ]
  },
  options: {
    scales: {
      xAxes: [{display: false,stacked: true}],
      yAxes: [{display: false,stacked: true}],
    },
    elements: {rectangle: {borderWidth: 2}},
    legend: {display: false,},
    plugins: {datalabels: {color: 'white',formatter: (value, context) =>
      [context.dataset.label, value].join(' ')
    }}
  }
}"/>
</p>

<br>

# Mods Loading Time
<p align="center">
<img src="https://quickchart.io/chart?w=400&h=300&c={
  type: 'outlabeledPie',
  options: {
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
8f304e   5.63s Astral Sorcery;
813e81   4.85s OpenComputers;
a651a8   4.75s IndustrialCraft 2;
516fa8   4.65s Ender IO;
5161a8   2.69s CraftTweaker2;
495797   8.52s CraftTweaker2 (Script Loading);
cd922c   2.62s NuclearCraft;
213664   2.46s Forestry;
3e8160   2.34s The Twilight Forest;
308f7e   2.22s Quark: RotN Edition;
436e17   2.20s Integrated Dynamics;
3eb2ba   2.11s Botania;
a86e51   2.07s Extra Utilities 2;
ba3eb8   1.99s Cyclic;
7c813e   1.84s Thaumcraft;
8f4d30   1.78s Open Terrain Generator;
8c2ccd   1.66s Immersive Engineering;
61176e   1.53s Ice and Fire;
436e17   0.59s Had Enough Items;
3C6315   7.67s Had Enough Items (Plugins);
3C6315   0.87s Had Enough Items (Ingredient Filter);
649e21   1.46s OpenBlocks;
3e68ba   1.43s AE2 Unofficial Extended Life;
444444  12.69s 11 Other mods;
333333  38.72s 132 'Fast' mods (load 1.0s - 0.1s);
222222   7.74s 298 'Instant' mods (load %3C 0.1s)
`
    .split(';').reduce((a, l) => {
      l.match(/(\w{6}) *(\d*\.\d*)s (.*)/)
      .slice(1).map((a, i) => [[String.fromCharCode(35),a].join(''), parseFloat(a), a][i])
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

# Top Mods Details (except JEI, FML and Forge)
<p align="center">
<img src="https://quickchart.io/chart?w=400&h=450&c={
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
1: Construction;
2: Loading Resources;
3: PreInitialization;
4: Initialization;
5: InterModComms$IMC;
6: PostInitialization;
7: LoadComplete;
8: ModIdMapping
`
    .split(';')
      .map(l => l.match(/\d: (.*)/).slice(1))
      .forEach(([name]) => a.datasets.push({ label: name, data: [] }));
`
                        1      2      3      4      5      6      7      8  ;
Astral Sorcery      |  0.21|  0.00|  4.50|  0.91|  0.00|  0.00|  0.00|  0.00;
OpenComputers       |  0.16|  0.01|  3.14|  1.55|  0.00|  0.00|  0.00|  0.00;
IndustrialCraft 2   |  0.59|  0.00|  3.65|  0.51|  0.00|  0.00|  0.00|  0.00;
Ender IO            |  1.72|  0.01|  2.72|  0.20|  0.00|  0.00|  0.00|  0.00;
CraftTweaker2       |  0.10|  0.00|  2.58|  0.00|  0.00|  0.00|  0.00|  0.00;
NuclearCraft        |  0.05|  0.00|  2.38|  0.19|  0.00|  0.00|  0.00|  0.00;
Forestry            |  0.31|  0.00|  1.82|  0.32|  0.00|  0.00|  0.00|  0.00;
The Twilight Forest |  1.17|  0.00|  1.06|  0.11|  0.00|  0.00|  0.00|  0.00;
Quark: RotN Edition |  0.02|  0.00|  2.15|  0.05|  0.00|  0.00|  0.00|  0.00;
Integrated Dynamics |  0.15|  0.00|  2.02|  0.03|  0.00|  0.00|  0.00|  0.00;
Botania             |  1.39|  0.01|  0.55|  0.16|  0.00|  0.00|  0.00|  0.00;
Extra Utilities 2   |  0.03|  0.00|  2.02|  0.01|  0.00|  0.00|  0.00|  0.00
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
<img src="https://quickchart.io/chart?w=700&c={
  options: {
    elements: { rectangle: { borderWidth: 1 } },
    legend: false
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
  1.76: jeresources.jei.JEIConfig;
  0.76: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  0.62: com.buuz135.industrial.jei.JEICustomPlugin;
  0.59: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.56: ic2.jeiIntegration.SubModule;
  0.53: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  0.26: org.squiddev.plethora.integration.jei.IntegrationJEI;
  0.21: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.20: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.16: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.16: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  0.14: ninjabrain.gendustryjei.GendustryJEIPlugin;
  0.11: net.bdew.jeibees.BeesJEIPlugin;
  0.10: forestry.factory.recipes.jei.FactoryJeiPlugin;
  0.10: zzzank.mod.jei_area_fixer.JEIAreaFixerJEIPlugin;
  1.43: Other 125 Plugins
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
<p align="center">
<img src="https://quickchart.io/chart?w=500&h=400&c={
  options: {
    rotation: Math.PI,
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
            text: [162.48,'s'].join(''),
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
993A00   0.22s Loading sounds;
994400   0.28s Loading Resource - SoundHandler;
444444 161.98s Other
`
    .split(';')
      .map(l => l.match(/(\w{6}) *(\d*\.\d*)s (.*)/))
      .forEach(([, col, time, name]) => {
        a.labels.push([name, ' ', time, 's'].join(''));
        a.datasets[0].data.push(parseFloat(time));
        a.datasets[0].backgroundColor.push([String.fromCharCode(35), col].join(''))
      })
      ; return a
  })()}
}"/>
</p>

<br>
