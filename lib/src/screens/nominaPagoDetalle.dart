import 'dart:io';

import 'package:capital24_2/src/models/nominaModel.dart';
import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:capital24_2/src/widgets/appHamburguesaEmpleadoEspejo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';

class NominaPagoDetalle extends StatefulWidget {
  static const String routeName = '/desglosePagoDetalle';
  _NominaPagoDetalleState createState() => _NominaPagoDetalleState();
}

class _NominaPagoDetalleState extends State<NominaPagoDetalle> {
  final _prefs = PreferenciasUsuario();
  bool showSpinner = false;

  void setSpinnerstatus(bool status) {
    setState(() {
      showSpinner = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    final DesglosePagoModel desglosesPagoModel =
        ModalRoute.of(context)!.settings.arguments as DesglosePagoModel;
    var f = NumberFormat('#,###,###.0#', 'en_US');
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Detalle Mis Pagos"),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
      endDrawer: HamburguesaEmpleadoEspejo(),
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
              itemCount: desglosesPagoModel.pagos!.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: ExpansionTile(
                      title: Text(
                        "Periodo " +
                            desglosesPagoModel.pagos![index].proceso
                                .toString() +
                            " " +
                            desglosesPagoModel.pagos![index].periodo.toString(),
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
                              title: Text(desglosesPagoModel.pagos![index].banco
                                  .toString()),
                            ),
                            ListTile(
                              subtitle: Text(
                                "Cuenta Colaborador",
                                textAlign: TextAlign.left,
                              ),
                              title: Text(desglosesPagoModel
                                  .pagos![index].cuenta
                                  .toString()),
                            ),
                            ListTile(
                              subtitle: Text(
                                "Clabe Colaborador",
                                textAlign: TextAlign.left,
                              ),
                              title: Text(desglosesPagoModel
                                  .pagos![index].cuentaClabe
                                  .toString()),
                            ),
                            ListTile(
                              subtitle: Text(
                                "Lugar de Pago",
                                textAlign: TextAlign.left,
                              ),
                              title: Text(desglosesPagoModel
                                  .pagos![index].lugarPago
                                  .toString()),
                            ),
                            ListTile(
                              subtitle: Text(
                                "Importe Depositado",
                                textAlign: TextAlign.left,
                              ),
                              title: Text(f
                                  .format(
                                      desglosesPagoModel.pagos![index].importe)
                                  .toString()),
                            ),
                            mostrarCFDI(context, index),
                            /*   ListTile(
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

  mostrarCFDI(BuildContext context, int index) {
    final DesglosePagoModel desglosesPagoModel =
        ModalRoute.of(context)!.settings.arguments as DesglosePagoModel;
    if (desglosesPagoModel.pagos![index].mostrarRecibo == "N") {
      return Container();
    } else {
      return ListTile(
        subtitle: Text("Descarga",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Theme.of(context).dividerColor,
            )),
        title: Text("Comprobante CFDI"),
        onTap: () => null, //response(context, index),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Theme.of(context).dividerColor,
        ),
      );
    }
  }

  Future response(BuildContext context, int index) async {
    setSpinnerstatus(true);
    Directory appDocDirectory =
        await getApplicationDocumentsDirectory(); //getExternalStorageDirectory
    Dio dio = Dio();
    final DesglosePagoModel desglosesPagoModel =
        ModalRoute.of(context)!.settings.arguments as DesglosePagoModel;
    final headersToken = {
      'Authorization': 'Token ${_prefs.token}',
    };
    final recibo = desglosesPagoModel.pagos![index].recibo.toString();
    http.Response response =
        await http.get(Uri.parse(recibo), headers: headersToken);
    final etiquetaRecibo =
        '${desglosesPagoModel.mesAnio}. Proceso: ${desglosesPagoModel.pagos![index].proceso}. Periodo: ${desglosesPagoModel.pagos![index].periodo.toString()}';

    if (Platform.isAndroid) {
      if (response.statusCode == 200) {
        if (await canLaunch(recibo)) {
          await launch(
            recibo,
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
      }
      setSpinnerstatus(false);
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
