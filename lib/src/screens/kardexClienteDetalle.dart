//import 'dart:convert';

import 'dart:convert';
import 'dart:io';

import 'package:capital24_2/src/models/kardexClienteModel.dart';
import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:capital24_2/src/widgets/appHamburguesaClienteEspejo.dart';
import 'package:capital24_2/src/widgets/appNoEmpleado.dart';
import 'package:capital24_2/src/widgets/appNoLogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:universal_echarts/universal_echarts.dart';

class KardexClienteDetalle extends StatelessWidget {
  static const String routeName = '/kardexClienteDetalle';
  @override
  Widget build(BuildContext context) {
    final _prefs = PreferenciasUsuario();
    final _screenSize = MediaQuery.of(context).size;
    if (_prefs.tipoUsuario == '') {
      return NoLogin();
    } else {
      if (_prefs.tipoUsuario == 'empleado') {
        return NoEmpleado();
      } else {
        return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
              title: Text("Kardex Detalle"),
              centerTitle: true,
              leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back)),
            ),
            endDrawer: HamburguesaClienteEspejo(),
            body: Center(
                child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Column(
                        children: [
                          Container(
                            width: _screenSize.width * .8,
                            child: Text(
                              "Consulta ausentismos e incapacidades de colaboradores",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color),
                            ),
                          ),
                        ],
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
                  child: _graficaKardex(context),
                ),
              ]),
            )));
      }
    }
  }

  _graficaKardex(context) {
    final MesKardex kardexClienteModel =
        ModalRoute.of(context)!.settings.arguments as MesKardex;
    final _screenSize = MediaQuery.of(context).size;
    var mes = kardexClienteModel.mes;

    if (kardexClienteModel.valores![0].total == 0 &&
        kardexClienteModel.valores![1].total == 0 &&
        kardexClienteModel.valores![2].total == 0 &&
        kardexClienteModel.valores![3].total == 0 &&
        kardexClienteModel.valores![4].total == 0 &&
        kardexClienteModel.valores![5].total == 0 &&
        kardexClienteModel.valores![6].total == 0 &&
        kardexClienteModel.valores![7].total == 0 &&
        kardexClienteModel.valores![8].total == 0) {
      return Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Durante $mes no se registraron ausentismos o incapacidades de los colaboradores",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color),
              ),
              SizedBox(
                height: _screenSize.height * .05,
              ),
              Icon(FontAwesomeIcons.calendarCheck,
                  color: Theme.of(context).dividerColor, size: 45)
            ],
          ),
        ),
      );
    } else {
      final incidenciasKardex = [
        for (int i = 0; i < kardexClienteModel.valores!.length; i++)
          kardexClienteModel.valores![i].marca
      ];
      for (int i = 0; i < kardexClienteModel.valores!.length; i++) {
        incAccidenteTotal() {
          if (kardexClienteModel.valores![0].total == 0) {
            return [];
          } else {
            return kardexClienteModel.valores![0].total;
          }
        }

        incAccidenteMarca() {
          if (kardexClienteModel.valores![0].total == 0) {
            return [];
          } else {
            return kardexClienteModel.valores![0].marca;
          }
        }

        permisoSGTotal() {
          if (kardexClienteModel.valores![1].total == 0) {
            return [];
          } else {
            return kardexClienteModel.valores![1].total;
          }
        }

        permisoSGMarca() {
          if (kardexClienteModel.valores![1].total == 0) {
            return [];
          } else {
            return kardexClienteModel.valores![1].marca;
          }
        }

        incapacidadEGTotal() {
          if (kardexClienteModel.valores![2].total == 0) {
            return [];
          } else {
            return kardexClienteModel.valores![2].total;
          }
        }

        incapacidadEGMarca() {
          if (kardexClienteModel.valores![2].total == 0) {
            return [];
          } else {
            return kardexClienteModel.valores![2].marca;
          }
        }

        faltasTotal() {
          if (kardexClienteModel.valores![3].total == 0) {
            return [];
          } else {
            return kardexClienteModel.valores![3].total;
          }
        }

        faltasMarca() {
          if (kardexClienteModel.valores![3].total == 0) {
            return [];
          } else {
            return kardexClienteModel.valores![3].marca;
          }
        }

        incEnlaceTotal() {
          if (kardexClienteModel.valores![4].total == 0) {
            return [];
          } else {
            return kardexClienteModel.valores![4].total;
          }
        }

        incEnlaceMarca() {
          if (kardexClienteModel.valores![4].total == 0) {
            return [];
          } else {
            return kardexClienteModel.valores![4].marca;
          }
        }

        incMatTotal() {
          if (kardexClienteModel.valores![5].total == 0) {
            return [];
          } else {
            return kardexClienteModel.valores![5].total;
          }
        }

        incMatMarca() {
          if (kardexClienteModel.valores![5].total == 0) {
            return [];
          } else {
            return kardexClienteModel.valores![5].marca;
          }
        }

        permisoCGTotal() {
          if (kardexClienteModel.valores![6].total == 0) {
            return [];
          } else {
            return kardexClienteModel.valores![6].total;
          }
        }

        permisoCGMarca() {
          if (kardexClienteModel.valores![6].total == 0) {
            return [];
          } else {
            return kardexClienteModel.valores![6].marca;
          }
        }

        diaSTotal() {
          if (kardexClienteModel.valores![7].total == 0) {
            return [];
          } else {
            return kardexClienteModel.valores![7].total;
          }
        }

        diaSMarca() {
          if (kardexClienteModel.valores![7].total == 0) {
            return [];
          } else {
            return kardexClienteModel.valores![7].marca;
          }
        }

        vacacionesTotal() {
          if (kardexClienteModel.valores![8].total == 0) {
            return [];
          } else {
            return kardexClienteModel.valores![8].total;
          }
        }

        vacacionesMarca() {
          if (kardexClienteModel.valores![8].total == 0) {
            return [];
          } else {
            return kardexClienteModel.valores![8].marca;
          }
        }

        // ignore: unused_local_variable
        bool kisweb;
        try {
          if (Platform.isIOS || Platform.isAndroid) {
            kisweb = false;
            return Container(child: Echarts(theme: 'light', option: '''
        {

    tooltip: {
        show: false
    },
    legend: {
        show:false,
        orient: 'vertical',
        left: 'left',
        data: ${jsonEncode(incidenciasKardex)},
    },
    series: [
        {
            name: 'Circulo',
            type: 'pie',
            avoidLabelOverlap: false,
            center: ['50%', '40%'],
            radius: ['75%','50%'],
            data: [
              {
              name: ${jsonEncode(incAccidenteMarca())},
              value: ${jsonEncode(incAccidenteTotal())}
             },
             {
              name: ${jsonEncode(permisoSGMarca())},
              value: ${jsonEncode(permisoSGTotal())}
              },
              {
              name: ${jsonEncode(incapacidadEGMarca())},
              value: ${jsonEncode(incapacidadEGTotal())}
              },

              {
              name: ${jsonEncode(incEnlaceMarca())},
              value: ${jsonEncode(incEnlaceTotal())}
              },
              {
              name: ${jsonEncode(incMatMarca())},
              value: ${jsonEncode(incMatTotal())}
              },
              {
              name: ${jsonEncode(permisoCGMarca())},
              value: ${jsonEncode(permisoCGTotal())}
              },
              {
              name: ${jsonEncode(faltasMarca())},
              value: ${jsonEncode(faltasTotal())}
              },
              {
              name: ${jsonEncode(diaSMarca())},
              value: ${jsonEncode(diaSTotal())}
              },
              {
              name: ${jsonEncode(vacacionesMarca())},
              value: ${jsonEncode(vacacionesTotal())}
              },

            ],
            labelLine: {
                show: false
                },
            label: {
                show: false,
                formatter: '{c} DÍAS {b} {d}%',
                position: 'center'
            },
            emphasis: {
                label: {
                    show: true,
                    fontSize: '16',
                    fontWeight: 'bold',
                    formatter: '{b}({d}%) = {c} DÍA',
                    color: '#003C71'

                }
            }
        }
    ]

        }
        '''));
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
            //         child: UniversalEcharts.drawChart('''
            //     {

            // tooltip: {
            //     show: false
            // },
            // legend: {
            //     show:false,
            //     orient: 'vertical',
            //     left: 'left',
            //     data: ${jsonEncode(incidenciasKardex)},
            // },
            // series: [
            //     {
            //         name: 'Circulo',
            //         type: 'pie',
            //         avoidLabelOverlap: false,
            //         center: ['50%', '40%'],
            //         radius: ['75%','50%'],
            //         data: [
            //           {
            //           name: ${jsonEncode(incAccidenteMarca())},
            //           value: ${jsonEncode(incAccidenteTotal())}
            //          },
            //          {
            //           name: ${jsonEncode(permisoSGMarca())},
            //           value: ${jsonEncode(permisoSGTotal())}
            //           },
            //           {
            //           name: ${jsonEncode(incapacidadEGMarca())},
            //           value: ${jsonEncode(incapacidadEGTotal())}
            //           },

            //           {
            //           name: ${jsonEncode(incEnlaceMarca())},
            //           value: ${jsonEncode(incEnlaceTotal())}
            //           },
            //           {
            //           name: ${jsonEncode(incMatMarca())},
            //           value: ${jsonEncode(incMatTotal())}
            //           },
            //           {
            //           name: ${jsonEncode(permisoCGMarca())},
            //           value: ${jsonEncode(permisoCGTotal())}
            //           },
            //           {
            //           name: ${jsonEncode(faltasMarca())},
            //           value: ${jsonEncode(faltasTotal())}
            //           },
            //           {
            //           name: ${jsonEncode(diaSMarca())},
            //           value: ${jsonEncode(diaSTotal())}
            //           },
            //           {
            //           name: ${jsonEncode(vacacionesMarca())},
            //           value: ${jsonEncode(vacacionesTotal())}
            //           },

            //         ],
            //         labelLine: {
            //             show: false
            //             },
            //         label: {
            //             show: false,
            //             formatter: '{c} DÍAS {b} {d}%',
            //             position: 'center'
            //         },
            //         emphasis: {
            //             label: {
            //                 show: true,
            //                 fontSize: '16',
            //                 fontWeight: 'bold',
            //                 formatter: '{b}({d}%) = {c} DÍA',
            //                 color: '#003C71'

            //             }
            //         }
            //     }
            // ]

            //     }
            //     ''')
          ),
        );
      }
    }
  }
}
