import 'dart:convert';
import 'dart:io';

import 'package:capital24_2/src/models/altasBajasModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:universal_echarts/universal_echarts.dart';

class AppAltasBajas extends StatelessWidget {
  final IndicadorNegocioModel? altasBajasModel;
  AppAltasBajas({this.altasBajasModel});
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    if (altasBajasModel!.datos!.length == 0) {
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
              Icon(Icons.thumbs_up_down,
                  color: Theme.of(context).dividerColor, size: 45)
            ],
          ),
        ),
      );
    } else {
      final nombreAnioAnteriorAltas = [altasBajasModel!.datos![0].anio ?? []];
      final nombreAnioAnteriorBajas = [altasBajasModel!.datos![0].anio ?? []];

      final nombreAnioActualAltas = [altasBajasModel!.datos![1].anio ?? []];
      final nombreAnioActualBajas = [altasBajasModel!.datos![1].anio ?? []];

      final dataAnioAnteriorAltas = [
        for (int i = 0; i < altasBajasModel!.datos![0].datos!.length; i++)
          altasBajasModel!.datos![0].datos![i].altas ?? []
      ];

      final dataAnioAnteriorBajas = [
        for (int i = 0; i < altasBajasModel!.datos![0].datos!.length; i++)
          altasBajasModel!.datos![0].datos![i].bajas ?? []
      ];

      final dataAnioActualAltas = [
        for (int i = 0; i < altasBajasModel!.datos![1].datos!.length; i++)
          altasBajasModel!.datos![1].datos![i].altas ?? []
      ];

      final dataAnioActualBajas = [
        for (int i = 0; i < altasBajasModel!.datos![1].datos!.length; i++)
          altasBajasModel!.datos![1].datos![i].bajas ?? []
      ];

      // ignore: unused_local_variable
      bool kisweb;
      try {
        if (Platform.isIOS) {
          kisweb = false;
          return Echarts(theme: 'light', option: '''
      {
       
        legend: {
        left: 100
      
        },
        tooltip: {
          trigger: 'axis',
          axisPointer:{
            type: 'shadow'
          }
        },
        grid: {
          left: '15%',
          right: '5%'
        },
        xAxis: {
          type: 'category',
          boundaryGap: true,
          axisTick: {show: false},
          data: [
            'Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'
            ]
        },
        yAxis: {
          type: 'value',
          gridIndex: 0,
          splitLine:{
            show:false,
            },
          axisTick:{
            show:false,
            },
          axisLine:{
            color: '#D9d9d6',
            },
          splitNumber:5,
          splitArea: {
            show: true,
            areaStyle: {
              color: [
                'rgba(250,250,250,0.0)', 'rgba(217,217,214,0.1)'
                ],
            },
          }
        },
        series:[
           {
            name: 'Altas ' + ${jsonEncode(nombreAnioActualAltas)},
            type: 'bar',
            barGap: 0,
            stack: 'anio_actual', 
            color: '#529cff',
            data: ${jsonEncode(dataAnioActualAltas)},
            
          },
          {
            name: 'Bajas ' +${jsonEncode(nombreAnioActualBajas)},
            type: 'bar',
            barGap: 0,
            stack: 'anio_actual',
            color: '#C80077',
            data: ${jsonEncode(dataAnioActualBajas)}
          },
          {
            name: 'Altas ' +${jsonEncode(nombreAnioAnteriorAltas)},
            color: '#E9F3FF',
            type: 'bar',
            barGap: 0,
            stack: 'anio_anterior', 
            data: ${jsonEncode(dataAnioAnteriorAltas)},
            
          },
          {
            name: 'Bajas '  +${jsonEncode(nombreAnioAnteriorBajas)},
            type: 'bar',
            stack: 'anio_anterior',
            barGap: 0,
            color: '#F8DFEE',
            data: ${jsonEncode(dataAnioAnteriorBajas)},
            
          }
     
        ]
        
      }
      
      ''');
        } else if (Platform.isAndroid) {
          kisweb = false;
          return Echarts(theme: 'light', option: '''
      {
       
        legend: {
        left: 100
      
        },
        tooltip: {
          trigger: 'axis',
          axisPointer:{
            type: 'shadow'
          }
        },
        grid: {
          left: '15%',
          right: '5%'
        },
        xAxis: {
          type: 'category',
          boundaryGap: true,
          axisTick: {show: false},
          data: [
            'Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'
            ]
        },
        yAxis: {
          type: 'value',
          gridIndex: 0,
          splitLine:{
            show:false,
            },
          axisTick:{
            show:false,
            },
          axisLine:{
            color: '#D9d9d6',
            },
          splitNumber:5,
          splitArea: {
            show: true,
            areaStyle: {
              color: [
                'rgba(250,250,250,0.0)', 'rgba(217,217,214,0.1)'
                ],
            },
          }
        },
        series:[
           {
            name: 'Altas ' + ${jsonEncode(nombreAnioActualAltas)},
            type: 'bar',
            barGap: 0,
            stack: 'anio_actual', 
            color: '#529cff',
            data: ${jsonEncode(dataAnioActualAltas)},
            
          },
          {
            name: 'Bajas ' +${jsonEncode(nombreAnioActualBajas)},
            type: 'bar',
            barGap: 0,
            stack: 'anio_actual',
            color: '#C80077',
            data: ${jsonEncode(dataAnioActualBajas)}
          },
          {
            name: 'Altas ' +${jsonEncode(nombreAnioAnteriorAltas)},
            color: '#E9F3FF',
            type: 'bar',
            barGap: 0,
            stack: 'anio_anterior', 
            data: ${jsonEncode(dataAnioAnteriorAltas)},
            
          },
          {
            name: 'Bajas '  +${jsonEncode(nombreAnioAnteriorBajas)},
            type: 'bar',
            stack: 'anio_anterior',
            barGap: 0,
            color: '#F8DFEE',
            data: ${jsonEncode(dataAnioAnteriorBajas)},
            
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
          width: _screenSize.width * .5,
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
          //     child: UniversalEcharts.drawChart(('''
          // {

          //   legend: {
          //   left: 100

          //   },
          //   tooltip: {
          //     trigger: 'axis',
          //     axisPointer:{
          //       type: 'shadow'
          //     }
          //   },
          //   grid: {
          //     left: '15%',
          //     right: '5%'
          //   },
          //   xAxis: {
          //     type: 'category',
          //     boundaryGap: true,
          //     axisTick: {show: false},
          //     data: [
          //       'Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'
          //       ]
          //   },
          //   yAxis: {
          //     type: 'value',
          //     gridIndex: 0,
          //     splitLine:{
          //       show:false,
          //       },
          //     axisTick:{
          //       show:false,
          //       },
          //     axisLine:{
          //       color: '#D9d9d6',
          //       },
          //     splitNumber:5,
          //     splitArea: {
          //       show: true,
          //       areaStyle: {
          //         color: [
          //           'rgba(250,250,250,0.0)', 'rgba(217,217,214,0.1)'
          //           ],
          //       },
          //     }
          //   },
          //   series:[
          //      {
          //       name: 'Altas ' + ${jsonEncode(nombreAnioActualAltas)},
          //       type: 'bar',
          //       barGap: 0,
          //       stack: 'anio_actual',
          //       color: '#529cff',
          //       data: ${jsonEncode(dataAnioActualAltas)},

          //     },
          //     {
          //       name: 'Bajas ' +${jsonEncode(nombreAnioActualBajas)},
          //       type: 'bar',
          //       barGap: 0,
          //       stack: 'anio_actual',
          //       color: '#C80077',
          //       data: ${jsonEncode(dataAnioActualBajas)}
          //     },
          //     {
          //       name: 'Altas ' +${jsonEncode(nombreAnioAnteriorAltas)},
          //       color: '#E9F3FF',
          //       type: 'bar',
          //       barGap: 0,
          //       stack: 'anio_anterior',
          //       data: ${jsonEncode(dataAnioAnteriorAltas)},

          //     },
          //     {
          //       name: 'Bajas '  +${jsonEncode(nombreAnioAnteriorBajas)},
          //       type: 'bar',
          //       stack: 'anio_anterior',
          //       barGap: 0,
          //       color: '#F8DFEE',
          //       data: ${jsonEncode(dataAnioAnteriorBajas)},

          //     }

          //   ]

          // }

          // ''')),
        ),
      );
    }
  }
}
