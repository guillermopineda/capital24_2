import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AppTarjetaDatoServiciosEmpleado extends StatefulWidget {
  _AppTarjetaDatoServiciosEmpleadoState createState() =>
      _AppTarjetaDatoServiciosEmpleadoState();
}

class _AppTarjetaDatoServiciosEmpleadoState
    extends State<AppTarjetaDatoServiciosEmpleado> {
  bool showSpinner = false;
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
    //if (widget.datoLaboralEmpleadoModel.mostrarCarta == "N") {
    if (1 < 0) {
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
        onTap: () => null, //response(context),
      );
    }
  }
}
