import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';

class AppHeadcount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final _screenSize = MediaQuery.of(context).size;

    // if (headcountModel.datos.isEmpty) {
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
    //           Icon(FontAwesomeIcons.users,
    //               color: Theme.of(context).dividerColor, size: 45)
    //         ],
    //       ),
    //     ),
    //   );
    // } else {

    final nombreAnioAnterior = [];
    final nombreAnioActual = [];
    final dataAnioAnterior = [];
    final dataAnioActual = [];

    // final nombreAnioAnterior = [headcountModel.datos[0].anio ?? []];
    // final nombreAnioActual = [headcountModel.datos[1].anio ?? []];

    // final dataAnioAnterior = [
    //   for (int i = 0; i < headcountModel.datos[0].datos.length; i++)
    //     headcountModel.datos[0].datos[i].headcount ?? []
    // ];

    // final dataAnioActual = [
    //   for (int i = 0; i < headcountModel.datos[1].datos.length; i++)
    //     headcountModel.datos[1].datos[i].headcount ?? []
    // ];

    return Echarts(theme: 'light', option: '''
      {
        legend: {},
        tooltip: {
          trigger: 'axis',
          axisPointer:{
            type: 'shadow'
          }
        },
        color: ['#5ce1e6','#cb6ce6'],
        grid: {
          left: '15%',
          right:'10%'
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
            color: '#AEE099',
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
            name: ${jsonEncode(nombreAnioActual)},
            type: 'bar',
            barGap: 0,
            data: ${jsonEncode(dataAnioActual)}
          },
          {
            name: ${jsonEncode(nombreAnioAnterior)},
            type: 'bar',
            barGap: 0,
            data: ${jsonEncode(dataAnioAnterior)}
          }
          
          
        ]

      }
      
      ''');
  }
}
//}
