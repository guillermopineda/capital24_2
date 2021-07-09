import 'dart:io';

import 'package:capital24_2/src/models/plantillaColaboradoresModel.dart';
import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:capital24_2/src/widgets/appHamburguesaClienteEspejo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:http/http.dart' as http;

import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PlantillaColaboradoresPagoDetalleDesglose extends StatefulWidget {
  static const String routeName = '/plantillaColaboradoresPagoDetalleDesglose';

  @override
  _PlantillaColaboradoresPagoDetalleDesgloseState createState() =>
      _PlantillaColaboradoresPagoDetalleDesgloseState();
}

class _PlantillaColaboradoresPagoDetalleDesgloseState
    extends State<PlantillaColaboradoresPagoDetalleDesglose> {
  final _prefs = PreferenciasUsuario();
  bool showSpinner = false;

  void setSpinnerstatus(bool status) {
    setState(() {
      showSpinner = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final Pagos plantillaColaboradoresModel =
        ModalRoute.of(context)!.settings.arguments as Pagos;
    var f = NumberFormat('#,###,###.0#', 'en_US');
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Detalle Pagos"),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
      endDrawer: HamburguesaClienteEspejo(),
      body: ModalProgressHUD(
        progressIndicator: AlertDialog(
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 5.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: _screenSize.height * .01),
              Text(
                "Descargando CFDI",
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: _screenSize.height * .01),
              Text(
                "Por favor consulta la descarga en tu dispositivo",
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: _screenSize.height * .03),
              Icon(FontAwesomeIcons.fileDownload,
                  color: Theme.of(context).dividerColor, size: 50),
              SizedBox(height: _screenSize.height * .03),
              Container(
                  width: _screenSize.width * .5,
                  child: LinearProgressIndicator(
                    backgroundColor: Theme.of(context).dividerColor,
                  ))
            ],
          ),
        ),
        inAsyncCall: showSpinner,
        child: SafeArea(
          bottom: true,
          maintainBottomViewPadding: true,
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: plantillaColaboradoresModel.pagos!.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: ExpansionTile(
                      title: Text(
                        "Periodo " +
                            plantillaColaboradoresModel.pagos![index].proceso
                                .toString() +
                            " " +
                            plantillaColaboradoresModel.pagos![index].periodo
                                .toString()
                                .toString(),
                        style: TextStyle(fontSize: 16.0),
                        textAlign: TextAlign.left,
                      ),
                      trailing: Icon(
                        Icons.expand_more,
                        color: Theme.of(context).dividerColor,
                      ),
                      children: <Widget>[
                        Divider(
                          color: Theme.of(context).dividerColor,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              subtitle: Text(
                                "Banco Colaborador",
                                textAlign: TextAlign.left,
                              ),
                              title: Text(plantillaColaboradoresModel
                                  .pagos![index].banco
                                  .toString()),
                            ),
                            ListTile(
                              subtitle: Text(
                                "Cuenta Colaborador",
                                textAlign: TextAlign.left,
                              ),
                              title: Text(plantillaColaboradoresModel
                                  .pagos![index].cuenta
                                  .toString()),
                            ),
                            ListTile(
                              subtitle: Text(
                                "Clabe Colaborador",
                                textAlign: TextAlign.left,
                              ),
                              title: Text(plantillaColaboradoresModel
                                  .pagos![index].cuentaClabe
                                  .toString()),
                            ),
                            ListTile(
                              subtitle: Text(
                                "Lugar de Pago",
                                textAlign: TextAlign.left,
                              ),
                              title: Text(plantillaColaboradoresModel
                                  .pagos![index].lugarPago
                                  .toString()),
                            ),
                            ListTile(
                              subtitle: Text(
                                "Importe Depositado",
                                textAlign: TextAlign.left,
                              ),
                              title: Text(f
                                  .format(plantillaColaboradoresModel
                                      .pagos![index].importe)
                                  .toString()),
                            ),
                            ListTile(
                              subtitle: Text("Descarga",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Theme.of(context).dividerColor,
                                  )),
                              title: Text(
                                "Comprobante CFDI",
                              ),
                              onTap: () => response(context, index),
                              trailing: Icon(
                                Icons.keyboard_arrow_right,
                                color: Theme.of(context).dividerColor,
                              ),
                            ),
                            /*    ListTile(
                              subtitle: Text("Descarga",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Theme.of(context).dividerColor,
                                  )),
                              title: Text(
                                "Comprobante Xml",
                              ),
                              trailing: Icon(
                                Icons.keyboard_arrow_right,
                                color: Theme.of(context).dividerColor,
                              ),
                            ), */
                            Divider(
                              color: Theme.of(context).dividerColor,
                            ),
                          ],
                        )
                      ],
                    ));
              }),
        ),
      ),
    );
  }

  Future response(BuildContext context, int index) async {
    setSpinnerstatus(true);
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    Dio dio = Dio();
    final Pagos pagos = ModalRoute.of(context)!.settings.arguments as Pagos;

    final headersToken = {
      'Authorization': 'Token ${_prefs.token}',
    };
    final recibo = pagos.pagos![index].recibo.toString();
    http.Response response =
        await http.get(Uri.parse(recibo), headers: headersToken);
    final etiquetaRecibo =
        '${pagos.mesAnio}. Proceso: ${pagos.pagos![index].proceso}. Periodos: ${pagos.pagos![index].periodo.toString()}';

    if (Platform.isAndroid) {
      if (response.statusCode == 200) {
        if (await canLaunch(recibo)) {
          await launch(
            recibo,
            headers: headersToken,
          );
        }
      } else {
        showDialog(
            barrierDismissible: true,
            context: context,
            builder: (BuildContext context) {
              final _screenSize = MediaQuery.of(context).size;
              return AlertDialog(
                backgroundColor: Theme.of(context).backgroundColor,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: _screenSize.height * .01),
                    Text(
                      "Aún no se ha generado CFDI",
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1!.color),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: _screenSize.height * .01),
                    Text(
                      "Por favor realiza tu consulta en otro momento",
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1!.color),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: _screenSize.height * .03),
                    Icon(FontAwesomeIcons.fileInvoiceDollar,
                        color: Theme.of(context).dividerColor, size: 50),
                  ],
                ),
              );
            });

        setSpinnerstatus(false);
      }
    } else {
      if (Platform.isIOS) {
        if (response.statusCode == 200) {
          Response request = await dio.download(
              recibo, (appDocDirectory.path + '/' + '$etiquetaRecibo.pdf'),
              options: Options(headers: headersToken));

          print(request.statusCode);
          print(appDocDirectory.path);

          setSpinnerstatus(false);
          return request;
        } else {
          showDialog(
              barrierDismissible: true,
              context: context,
              builder: (BuildContext context) {
                final _screenSize = MediaQuery.of(context).size;
                return AlertDialog(
                  backgroundColor: Theme.of(context).backgroundColor,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: _screenSize.height * .01),
                      Text(
                        "Aún no se ha generado CFDI",
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodyText1!.color),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: _screenSize.height * .01),
                      Text(
                        "Por favor realiza tu consulta en otro momento",
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodyText1!.color),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: _screenSize.height * .03),
                      Icon(FontAwesomeIcons.fileInvoiceDollar,
                          color: Theme.of(context).dividerColor, size: 50),
                    ],
                  ),
                );
              });

          setSpinnerstatus(false);
        }
      }
    }
  }
}
