## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
284.53 sec
<br>
<sup><sub>(
4:44 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [107.44]},
      {label: 'FML stuff:', data: [177.09]}
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
8f304e   6.81s Astral Sorcery;
813e81   5.15s OpenComputers;
a651a8   4.18s IndustrialCraft 2;
516fa8   3.74s Ender IO;
cd922c   3.38s NuclearCraft;
213664   2.53s Forestry;
5161a8   2.40s CraftTweaker2;
495797   8.47s CraftTweaker2 (Script Loading);
ba3eb8   2.18s Cyclic;
308f7e   2.10s Quark: RotN Edition;
436e17   1.94s Integrated Dynamics;
3e8160   1.93s The Twilight Forest;
a86e51   1.90s Extra Utilities 2;
8f4d30   1.68s Open Terrain Generator;
3eb2ba   1.63s Botania;
8c2ccd   1.58s Immersive Engineering;
61176e   1.53s Ice and Fire;
436e17   1.48s Had Enough Items;
3C6315   8.00s Had Enough Items (Plugins);
3C6315   1.70s Had Enough Items (Ingredient Filter);
649e21   1.36s OpenBlocks;
3e68ba   1.29s AE2 Unofficial Extended Life;
7c813e   1.27s Thaumcraft;
444444  11.20s 10 Other mods;
333333  38.40s 134 'Fast' mods (load 1.0s - 0.1s);
222222   7.76s 295 'Instant' mods (load %3C 0.1s)
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
Astral Sorcery      |  0.18|  0.00|  6.11|  0.53|  0.00|  0.00|  0.00|  0.00;
OpenComputers       |  0.15|  0.00|  3.16|  1.85|  0.00|  0.00|  0.00|  0.00;
IndustrialCraft 2   |  0.58|  0.00|  2.98|  0.62|  0.00|  0.00|  0.00|  0.00;
Ender IO            |  1.17|  0.00|  2.40|  0.18|  0.00|  0.00|  0.00|  0.00;
NuclearCraft        |  1.25|  0.00|  1.92|  0.21|  0.00|  0.00|  0.00|  0.00;
Forestry            |  0.32|  0.00|  1.85|  0.35|  0.00|  0.00|  0.00|  0.00;
CraftTweaker2       |  0.14|  0.00|  2.25|  0.00|  0.00|  0.00|  0.00|  0.00;
Cyclic              |  0.04|  0.00|  1.77|  0.37|  0.00|  0.00|  0.00|  0.00;
Quark: RotN Edition |  0.02|  0.00|  2.01|  0.07|  0.00|  0.00|  0.00|  0.00;
Integrated Dynamics |  0.16|  0.00|  1.75|  0.03|  0.00|  0.00|  0.00|  0.00;
The Twilight Forest |  0.69|  0.00|  1.12|  0.12|  0.00|  0.00|  0.00|  0.00;
Extra Utilities 2   |  0.04|  0.00|  1.85|  0.02|  0.00|  0.00|  0.00|  0.00
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
  1.78: jeresources.jei.JEIConfig;
  1.06: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  0.61: com.buuz135.industrial.jei.JEICustomPlugin;
  0.53: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.49: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  0.41: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.33: ic2.jeiIntegration.SubModule;
  0.26: nc.integration.jei.NCJEI;
  0.23: crafttweaker.mods.jei.JEIAddonPlugin;
  0.21: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  0.19: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.18: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.14: ninjabrain.gendustryjei.GendustryJEIPlugin;
  0.10: net.bdew.jeibees.BeesJEIPlugin;
  0.09: lach_01298.qmd.jei.QMDJEI;
  1.40: Other 124 Plugins
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
            text: [177.09,'s'].join(''),
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
993A00   0.20s Loading sounds;
994400   0.26s Loading Resource - SoundHandler;
444444 176.63s Other
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
