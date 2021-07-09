import 'dart:convert';
import 'dart:io';

import 'package:capital24_2/src/models/indicadoresNegocioModel.dart';
import 'package:capital24_2/src/widgets/appHamburguesaClienteEspejo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universal_echarts/universal_echarts.dart';

class CostoPeriodo extends StatelessWidget {
  static const String routeName = '/costoPeriodo';
  @override
  Widget build(BuildContext context) {
    final IndicadorNegocioModel comuniindicadorNegocioModelcadoModel =
        ModalRoute.of(context)!.settings.arguments as IndicadorNegocioModel;
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text(
            comuniindicadorNegocioModelcadoModel.indicadorNegocio.toString(),
            maxLines: 1,
          ),
          centerTitle: true,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context, true);
              },
              child: Icon(Icons.arrow_back)),
        ),
        endDrawer: HamburguesaClienteEspejo(),
        body: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        "Consulta acumulados anuales por concepto  ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodyText1!.color),
                      ),
                      Icon(
                        Icons.touch_app,
                        color: Theme.of(context).dividerColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: _screenSize.height * .05,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  height: _screenSize.height * .7,
                  width: double.infinity,
                  child: _grafica(context),
                ),
              ],
            ),
          ),
        ));
  }

  _grafica(context) {
    final _screenSize = MediaQuery.of(context).size;
    final IndicadorNegocioModel comuniindicadorNegocioModelcadoModel =
        ModalRoute.of(context)!.settings.arguments as IndicadorNegocioModel;

    if (comuniindicadorNegocioModelcadoModel.anios!.isEmpty) {
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
              Icon(FontAwesomeIcons.fileInvoiceDollar,
                  color: Theme.of(context).dividerColor, size: 45)
            ],
          ),
        ),
      );
    } else {
      final dataAnioAnterior = [
        for (int i = 0;
            i < comuniindicadorNegocioModelcadoModel.anios![0].datos!.length;
            i++)
          comuniindicadorNegocioModelcadoModel.anios![0].datos![i].suma ?? []
      ];

      final dataAnioActual = [
        for (int i = 0;
            i < comuniindicadorNegocioModelcadoModel.anios![0].datos!.length;
            i++)
          comuniindicadorNegocioModelcadoModel.anios![1].datos![i].suma ?? []
      ];

      final nombreAnioAnterior =
          comuniindicadorNegocioModelcadoModel.anios![0].anio ?? "";

      final nombreAnioActual =
          comuniindicadorNegocioModelcadoModel.anios![1].anio ?? "";

      // ignore: unused_local_variable
      bool kisweb;
      try {
        if (Platform.isIOS) {
          kisweb = false;
          return Container(
            child: Echarts(theme: 'light', option: '''
        {
          legend: {},
          tooltip: {
            trigger: 'axis',
            axisPointer:{
              type: 'shadow'
            }
          },
          color: ['#7ED957','#ffbd59'],
          grid: {
            left: '25%',
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
              color: '#97dfe1',
              },
            splitNumber:10,
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
        
        '''),
          );
        } else if (Platform.isAndroid) {
          kisweb = false;
          return Container(
            child: Echarts(theme: 'light', option: '''
        {
          legend: {},
          tooltip: {
            trigger: 'axis',
            axisPointer:{
              type: 'shadow'
            }
          },
          color: ['#7ED957','#ffbd59'],
          grid: {
            left: '25%',
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
              color: '#97dfe1',
              },
            splitNumber:10,
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
        
        '''),
          );
        } else {
          kisweb = true;
        }
      } catch (e) {
        kisweb = true;
      }
      return Center(
        child: Container(
          width: _screenSize.width * .5,
          child: UniversalEcharts.drawChart(('''
          {
            legend: {},
            tooltip: {
              trigger: 'axis',
              axisPointer:{
                type: 'shadow'
              }
            },
            color: ['#7ED957','#ffbd59'],
            grid: {
              left: '25%',
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
                color: '#97dfe1',
                },
              splitNumber:10,
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
          
          ''')),
        ),
      );
    }
  }
}
