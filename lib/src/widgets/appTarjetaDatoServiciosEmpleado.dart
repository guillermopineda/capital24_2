import 'dart:io';

import 'package:capital24_2/src/models/informacionLaboralModel.dart';
import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class AppTarjetaDatoServiciosEmpleado extends StatefulWidget {
  _AppTarjetaDatoServiciosEmpleadoState createState() =>
      _AppTarjetaDatoServiciosEmpleadoState();

  final DatoLaboralEmpleadoModel? datoLaboralEmpleadoModel;
  AppTarjetaDatoServiciosEmpleado({this.datoLaboralEmpleadoModel});
}

class _AppTarjetaDatoServiciosEmpleadoState
    extends State<AppTarjetaDatoServiciosEmpleado> {
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
    return SizedBox(
      //height: _screenSize.height * .5,
      child: ModalProgressHUD(
          progressIndicator: AlertDialog(
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
                  "Descargando Carta Patronal",
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
          child: Card(
              elevation: 40.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: ExpansionTile(
                        leading: Icon(
                          FontAwesomeIcons.gripHorizontal,
                          color: Theme.of(context).dividerColor,
                        ),
                        title: Text(
                          "Servicios",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
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
                                aplicaPatronal(context),
                                Divider(
                                  color: Theme.of(context).dividerColor,
                                ),
                              ])
                        ],
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }

  aplicaPatronal(BuildContext context) {
    if (widget.datoLaboralEmpleadoModel!.mostrarCarta == "N") {
      //print(widget.datoLaboralEmpleadoModel.mostrarCarta);
      return ListTile(
        subtitle: Text("No disponible",
            textAlign: TextAlign.left,
            style: TextStyle(color: Theme.of(context).dividerColor)),
        title: Text("Carta Patronal"),
      );
    } else {
      // print(widget.datoLaboralEmpleadoModel.mostrarCarta);
      return ListTile(
        subtitle: Text(
          "Descarga",
          textAlign: TextAlign.left,
          style: TextStyle(color: Theme.of(context).dividerColor),
        ),
        title: Text("Carta Patronal"),
        onTap: () => response(context),
      );
    }
  }

  Future response(BuildContext context) async {
    setSpinnerstatus(true);
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    Dio dio = Dio();
    final headersToken = {'Authorization': 'Token ${_prefs.token}'};
    final carta = widget.datoLaboralEmpleadoModel!.cartaPatronal;
    http.Response response =
        await http.get(carta as Uri, headers: headersToken);
    final etiquetaCarta = "Carta Patronal " +
        widget.datoLaboralEmpleadoModel!.numeroEmpleado.toString();

    if (Platform.isAndroid) {
      if (response.statusCode == 100) {
        if (await canLaunch(carta!)) {
          await launch(
            carta,
            headers: headersToken,
          );
        }
        setSpinnerstatus(false);
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
                      "No es posible procesar tu solicitud",
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
                    Icon(FontAwesomeIcons.fileDownload,
                        color: Theme.of(context).dividerColor, size: 50),
                  ],
                ),
              );
            });
      }
      setSpinnerstatus(false);
    } else {
      if (Platform.isIOS) {
        if (response.statusCode == 200) {
          Response request = await dio.download(
              carta!, (appDocDirectory.path + '/' + '$etiquetaCarta.pdf'),
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
                        "No es posible procesar tu solicitud",
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
