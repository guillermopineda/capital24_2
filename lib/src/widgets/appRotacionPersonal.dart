import 'dart:convert';
import 'dart:io';

import 'package:capital24_2/src/models/altasBajasModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:universal_echarts/universal_echarts.dart';

class AppRotacionPersonal extends StatelessWidget {
  final IndicadorNegocioModel? rotacionModel;
  AppRotacionPersonal({this.rotacionModel});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    if (rotacionModel!.datos!.length == 0) {
      return Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Aun no se ha registrado información, vuelve pronto",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color),
              ),
              SizedBox(
                height: _screenSize.height * .05,
              ),
              Icon(FontAwesomeIcons.syncAlt,
                  color: Theme.of(context).dividerColor, size: 45)
            ],
          ),
        ),
      );
    } else {
      final nombreAnioAnterior = [rotacionModel!.datos![0].anio ?? []];
      final nombreAnioActual = [rotacionModel!.datos![1].anio ?? []];

      final dataAnioAnterior = [
        for (int i = 0; i < rotacionModel!.datos![0].datos!.length; i++)
          rotacionModel!.datos![0].datos![i].rotacion ?? []
      ];

      final dataAnioActual = [
        for (int i = 0; i < rotacionModel!.datos![1].datos!.length; i++)
          rotacionModel!.datos![1].datos![i].rotacion ?? []
      ];
      // ignore: unused_local_variable
      bool kisweb;
      try {
        if (Platform.isIOS) {
          kisweb = false;
          return Echarts(theme: 'light', option: ''' 
       {
    legend: {},
    tooltip: {
      formatter: function(params, ticket, callback) {
                console.log(params)
                var res = params[0].name;
                for (var i = 0, l = params.length; i < l; i++) {
                    res += '<br/><span style="color:' + params[i].color + '">\u25CF</span> '+ params[i].seriesName + ': ' + params[i].value + '%';
                }
                setTimeout(function() {
                    
                    callback(ticket, res);
                }, 100)
                return 'cargando';
            },
      trigger: 'axis',
    },


    color: ['#FF9559','#FFCAAC'],
    grid: {
      left: '15%',
      right:'15%'
    },
    xAxis: {
            type: 'category',
            boundaryGap: true,
          
            axisTick: {show: false},
            data: ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre']
            },
    yAxis: {type: 'value',
            gridIndex: 0,
            splitLine:{
              show:true,
            },
            axisTick:{
              show:true,
            },
            axisLabel: 
              {
              formatter: '{value} %'
              },
            axisLine:{
              color: '#97dfe1',
            },
            splitNumber: 5,
            splitArea: {
              show: false,
              areaStyle: {
                color: ['rgba(250,250,250,0.0)', 'rgba(0,119,200,.2)'],
                },
            }
            },
    // Declare several bar series, each will be mapped
    // to a column of dataset.source by default.
    series: [

        {name: ${jsonEncode(nombreAnioActual)},
          type: 'line',
          barGap: 0,
          data: ${jsonEncode(dataAnioActual)},
          markPoint:{
            label:{formatter: '{c}%'             
                },
            symbolSize: 75,
            data:[
              {type: 'max', name: 'Máximo'},
              {type: 'min', name: 'Mínimo'}
            ]
          },
          markLine:{
             label:{formatter: '{c}%'             
                },
            data: [
              {
                type: 'average', 
                name : 'Promedio'
                
                }
            ]
          }
          },
           {name: ${jsonEncode(nombreAnioAnterior)},
          type: 'line',
          barGap: 0,
          data: ${jsonEncode(dataAnioAnterior)},
          markPoint:{
            symbolSize: 75,
            label:{formatter: '{c}%'             
                },
            data:[
              {type: 'max', name: 'Máximo'},
              {type: 'min', name: 'Mínimo'}
            ]
          },
          markLine:{
             label:{formatter: '{c}%'             
                },
            data: [
              {type: 'average', name : 'Promedio'}
            ]
          }
          }
    ]
}
    ''');
        } else if (Platform.isAndroid) {
          kisweb = false;
          return Echarts(theme: 'light', option: ''' 
       {
    legend: {},
    tooltip: {
      formatter: function(params, ticket, callback) {
                console.log(params)
                var res = params[0].name;
                for (var i = 0, l = params.length; i < l; i++) {
                    res += '<br/><span style="color:' + params[i].color + '">\u25CF</span> '+ params[i].seriesName + ': ' + params[i].value + '%';
                }
                setTimeout(function() {
                    
                    callback(ticket, res);
                }, 100)
                return 'cargando';
            },
      trigger: 'axis',
    },


    color: ['#FF9559','#FFCAAC'],
    grid: {
      left: '15%',
      right:'15%'
    },
    xAxis: {
            type: 'category',
            boundaryGap: true,
          
            axisTick: {show: false},
            data: ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre']
            },
    yAxis: {type: 'value',
            gridIndex: 0,
            splitLine:{
              show:true,
            },
            axisTick:{
              show:true,
            },
            axisLabel: 
              {
              formatter: '{value} %'
              },
            axisLine:{
              color: '#97dfe1',
            },
            splitNumber: 5,
            splitArea: {
              show: false,
              areaStyle: {
                color: ['rgba(250,250,250,0.0)', 'rgba(0,119,200,.2)'],
                },
            }
            },
    // Declare several bar series, each will be mapped
    // to a column of dataset.source by default.
    series: [

        {name: ${jsonEncode(nombreAnioActual)},
          type: 'line',
          barGap: 0,
          data: ${jsonEncode(dataAnioActual)},
          markPoint:{
            label:{formatter: '{c}%'             
                },
            symbolSize: 75,
            data:[
              {type: 'max', name: 'Máximo'},
              {type: 'min', name: 'Mínimo'}
            ]
          },
          markLine:{
             label:{formatter: '{c}%'             
                },
            data: [
              {
                type: 'average', 
                name : 'Promedio'
                
                }
            ]
          }
          },
           {name: ${jsonEncode(nombreAnioAnterior)},
          type: 'line',
          barGap: 0,
          data: ${jsonEncode(dataAnioAnterior)},
          markPoint:{
            symbolSize: 75,
            label:{formatter: '{c}%'             
                },
            data:[
              {type: 'max', name: 'Máximo'},
              {type: 'min', name: 'Mínimo'}
            ]
          },
          markLine:{
             label:{formatter: '{c}%'             
                },
            data: [
              {type: 'average', name : 'Promedio'}
            ]
          }
          }
    ]
}
    ''');
        } else {
          kisweb = true;
        }
      } catch (e) {
        kisweb = true;
      }
      return Center(
          child: Container(
        width: _screenSize.width * .8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "El contenido de esta sección es visible únicamente en la app Capital24 iOS y Android",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1!.color,
                  fontSize: 40.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.appStoreIos,
                  size: 48,
                  color: Theme.of(context).dividerColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  FontAwesomeIcons.googlePlay,
                  size: 46,
                  color: Theme.of(context).dividerColor,
                ),
              ],
            ),
          ],
        ),

//       UniversalEcharts.drawChart(('''
//        {
//     legend: {},
//     tooltip: {
//       formatter: function(params, ticket, callback) {
//                 console.log(params)
//                 var res = params[0].name;
//                 for (var i = 0, l = params.length; i < l; i++) {
//                     res += '<br/><span style="color:' + params[i].color + '">\u25CF</span> '+ params[i].seriesName + ': ' + params[i].value + '%';
//                 }
//                 setTimeout(function() {

//                     callback(ticket, res);
//                 }, 100)
//                 return 'cargando';
//             },
//       trigger: 'axis',
//     },

//     color: ['#FF9559','#FFCAAC'],
//     grid: {
//       left: '15%',
//       right:'15%'
//     },
//     xAxis: {
//             type: 'category',
//             boundaryGap: true,

//             axisTick: {show: false},
//             data: ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre']
//             },
//     yAxis: {type: 'value',
//             gridIndex: 0,
//             splitLine:{
//               show:true,
//             },
//             axisTick:{
//               show:true,
//             },
//             axisLabel:
//               {
//               formatter: '{value} %'
//               },
//             axisLine:{
//               color: '#97dfe1',
//             },
//             splitNumber: 5,
//             splitArea: {
//               show: false,
//               areaStyle: {
//                 color: ['rgba(250,250,250,0.0)', 'rgba(0,119,200,.2)'],
//                 },
//             }
//             },
//     // Declare several bar series, each will be mapped
//     // to a column of dataset.source by default.
//     series: [

//         {name: ${jsonEncode(nombreAnioActual)},
//           type: 'line',
//           barGap: 0,
//           data: ${jsonEncode(dataAnioActual)},
//           markPoint:{
//             label:{formatter: '{c}%'
//                 },
//             symbolSize: 75,
//             data:[
//               {type: 'max', name: 'Máximo'},
//               {type: 'min', name: 'Mínimo'}
//             ]
//           },
//           markLine:{
//              label:{formatter: '{c}%'
//                 },
//             data: [
//               {
//                 type: 'average',
//                 name : 'Promedio'

//                 }
//             ]
//           }
//           },
//            {name: ${jsonEncode(nombreAnioAnterior)},
//           type: 'line',
//           barGap: 0,
//           data: ${jsonEncode(dataAnioAnterior)},
//           markPoint:{
//             symbolSize: 75,
//             label:{formatter: '{c}%'
//                 },
//             data:[
//               {type: 'max', name: 'Máximo'},
//               {type: 'min', name: 'Mínimo'}
//             ]
//           },
//           markLine:{
//              label:{formatter: '{c}%'
//                 },
//             data: [
//               {type: 'average', name : 'Promedio'}
//             ]
//           }
//           }
//     ]
// }
//     ''')
      ));
    }
  }
}
