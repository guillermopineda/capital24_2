import 'package:capital24_2/src/models/plantillaColaboradoresModel.dart';
import 'package:capital24_2/src/widgets/appHamburguesaClienteEspejo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PlantillaColaboradoresDetalleOtroDesglose extends StatelessWidget {
  static const String routeName = '/plantillaColaboradoresDetalleOtroDesglose';

  @override
  Widget build(BuildContext context) {
    final Otros plantillaColaboradoresModel =
        ModalRoute.of(context)!.settings.arguments as Otros;
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
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: plantillaColaboradoresModel.otros!.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: ExpansionTile(
                  title: Text(
                    "Periodo " +
                        plantillaColaboradoresModel.otros![index].proceso
                            .toString() +
                        " " +
                        plantillaColaboradoresModel.otros![index].periodo
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
                              .otros![index].banco
                              .toString()),
                        ),
                        ListTile(
                          subtitle: Text(
                            "Cuenta Colaborador",
                            textAlign: TextAlign.left,
                          ),
                          title: Text(plantillaColaboradoresModel
                              .otros![index].cuenta
                              .toString()),
                        ),
                        ListTile(
                          subtitle: Text(
                            "Clabe Colaborador",
                            textAlign: TextAlign.left,
                          ),
                          title: Text(plantillaColaboradoresModel
                              .otros![index].cuentaClabe
                              .toString()),
                        ),
                        ListTile(
                          subtitle: Text(
                            "Lugar de Pago",
                            textAlign: TextAlign.left,
                          ),
                          title: Text(plantillaColaboradoresModel
                              .otros![index].lugarPago
                              .toString()),
                        ),
                        ListTile(
                          subtitle: Text(
                            "Importe Depositado",
                            textAlign: TextAlign.left,
                          ),
                          title: Text(f
                              .format(plantillaColaboradoresModel
                                  .otros![index].importe)
                              .toString()),
                        ),
                        Divider(
                          color: Theme.of(context).dividerColor,
                        ),
                      ],
                    )
                  ],
                ));
          }),
    );
  }
}
