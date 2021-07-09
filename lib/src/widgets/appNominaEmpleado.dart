import 'package:capital24_2/src/models/nominaModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppNominaEmpleado extends StatefulWidget {
  _AppNominaEmpleadoState createState() => _AppNominaEmpleadoState();
  final List<DesglosePagoModel>? desglosesPagoModel;
  AppNominaEmpleado({this.desglosesPagoModel});
}

class _AppNominaEmpleadoState extends State<AppNominaEmpleado> {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Card(
        elevation: 40.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ExpansionTile(
                    leading: Icon(
                      FontAwesomeIcons.fileInvoiceDollar,
                      color: Theme.of(context).dividerColor,
                    ),
                    title: Text(
                      "Desglose de Pago",
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
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          cajaPagos(_screenSize),
                          Divider(
                            color: Theme.of(context).dividerColor,
                          ),
                        ],
                      ),
                    ])
              ]),
        ));
  }

  SizedBox cajaPagos(Size _screenSize) {
    if (widget.desglosesPagoModel!.length == 0) {
      return SizedBox(
        height: _screenSize.height * .1,
        child: mostrarPago(),
      );
    } else {
      return SizedBox(
        height: _screenSize.height * .2,
        child: mostrarPago(),
      );
    }
  }

  mostrarPago() {
    if (widget.desglosesPagoModel!.length == 0) {
      return ListTile(
        title: Text(
          "Sin información disponible",
          textAlign: TextAlign.left,
        ),
        subtitle: Text("Aún no se han registrados pagos"),
      );
    } else {
      return ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: widget.desglosesPagoModel!.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                    title: Text(
                      widget.desglosesPagoModel![index].mesAnio.toString(),
                      textAlign: TextAlign.left,
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Theme.of(context).dividerColor,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/desglosePagoDetalle',
                          arguments: widget.desglosesPagoModel![index]);
                    },
                  ),
                  Divider(
                    color: Theme.of(context).dividerColor,
                  ),
                ],
              ),
            );
          });
    }
  }
}
