import 'package:capital24_2/src/widgets/appHamburguesaClienteEspejo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class PlantillaColaboradoresPagoDetalleDesglose extends StatefulWidget {
  static const String routeName = '/plantillaColaboradoresPagoDetalleDesglose';

  @override
  _PlantillaColaboradoresPagoDetalleDesgloseState createState() =>
      _PlantillaColaboradoresPagoDetalleDesgloseState();
}

class _PlantillaColaboradoresPagoDetalleDesgloseState
    extends State<PlantillaColaboradoresPagoDetalleDesglose> {
  bool showSpinner = false;

  void setSpinnerstatus(bool status) {
    setState(() {
      showSpinner = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    // final Pagos plantillaColaboradoresModel =
    //     ModalRoute.of(context).settings.arguments;
    // var f = NumberFormat('#,###,###.0#', 'en_US');
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
              itemCount: 5, //plantillaColaboradoresModel.pagos.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: ExpansionTile(
                      title: Text(
                        "Hola",
                        // "Periodo " +
                        //     plantillaColaboradoresModel.pagos[index].proceso +
                        //     " " +
                        //     plantillaColaboradoresModel.pagos[index].periodo
                        //         .toString(),
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
                              title: Text(
                                  'plantillaColaboradoresModel.pagos[index].banco'),
                            ),
                            ListTile(
                              subtitle: Text(
                                "Cuenta Colaborador",
                                textAlign: TextAlign.left,
                              ),
                              title: Text(
                                  'plantillaColaboradoresModel.pagos[index].cuenta'),
                            ),
                            ListTile(
                              subtitle: Text(
                                "Clabe Colaborador",
                                textAlign: TextAlign.left,
                              ),
                              title: Text(
                                  'plantillaColaboradoresModel.pagos[index].cuentaClabe'),
                            ),
                            ListTile(
                              subtitle: Text(
                                "Lugar de Pago",
                                textAlign: TextAlign.left,
                              ),
                              title: Text(
                                  'plantillaColaboradoresModel.pagos[index].lugarPago'),
                            ),
                            ListTile(
                              subtitle: Text(
                                "Importe Depositado",
                                textAlign: TextAlign.left,
                              ),
                              title: Text(
                                'f',
                                // .format(plantillaColaboradoresModel
                                //     .pagos[index].importe)
                                // .toString()
                              ),
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
                              onTap: () => null, //response(context, index),
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
}