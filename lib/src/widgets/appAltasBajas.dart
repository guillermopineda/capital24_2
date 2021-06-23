import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';

class AppAltasBajas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final _screenSize = MediaQuery.of(context).size;
    // if (altasBajasModel.datos.isEmpty) {
    //   return Center(
    //     child: Container(
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         mainAxisSize: MainAxisSize.max,
    //         children: [
    //           Text(
    //             "Aun no se ha registrado información, vuelve pronto",
    //             textAlign: TextAlign.center,
    //             style: TextStyle(
    //                 color: Theme.of(context).textTheme.bodyText1.color),
    //           ),
    //           SizedBox(
    //             height: _screenSize.height * .05,
    //           ),
    //           Icon(Icons.thumbs_up_down,
    //               color: Theme.of(context).dividerColor, size: 45)
    //         ],
    //       ),
    //     ),
    //   );
    // } else {
    final nombreAnioAnteriorAltas = [];
    final nombreAnioAnteriorBajas = [];
    final nombreAnioActualAltas = [];
    final nombreAnioActualBajas = [];
    final dataAnioAnteriorAltas = [];
    final dataAnioAnteriorBajas = [];
    final dataAnioActualAltas = [];
    final dataAnioActualBajas = [];

    // final nombreAnioAnteriorAltas = [altasBajasModel.datos[0].anio ?? []];
    // final nombreAnioAnteriorBajas = [altasBajasModel.datos[0].anio ?? []];

    // final nombreAnioActualAltas = [altasBajasModel.datos[1].anio ?? []];
    // final nombreAnioActualBajas = [altasBajasModel.datos[1].anio ?? []];

    // final dataAnioAnteriorAltas = [
    //   for (int i = 0; i < altasBajasModel.datos[0].datos.length; i++)
    //     altasBajasModel.datos[0].datos[i].altas ?? []
    // ];

    // final dataAnioAnteriorBajas = [
    //   for (int i = 0; i < altasBajasModel.datos[0].datos.length; i++)
    //     altasBajasModel.datos[0].datos[i].bajas ?? []
    // ];

    // final dataAnioActualAltas = [
    //   for (int i = 0; i < altasBajasModel.datos[1].datos.length; i++)
    //     altasBajasModel.datos[1].datos[i].altas ?? []
    // ];

    // final dataAnioActualBajas = [
    //   for (int i = 0; i < altasBajasModel.datos[1].datos.length; i++)
    //     altasBajasModel.datos[1].datos[i].bajas ?? []
    // ];

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
  }
}
//}