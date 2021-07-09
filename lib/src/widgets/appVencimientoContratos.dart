import 'package:capital24_2/src/models/vencimientoContratosModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AppVencimientoContratos extends StatelessWidget {
  final List<VencimientoContratosModel>? vencimientoContratosModel;
  AppVencimientoContratos({this.vencimientoContratosModel});
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        height: _screenSize.height * .85,
        child: vencimientoContratos(context),
      ),
    );
  }

  vencimientoContratos(context) {
    final _screenSize = MediaQuery.of(context).size;
    if (vencimientoContratosModel!.isEmpty) {
      return Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Sin contratos por vencer, consulta la información mas tarde",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color),
              ),
              SizedBox(
                height: _screenSize.height * .05,
              ),
              Icon(Icons.description,
                  color: Theme.of(context).dividerColor, size: 45)
            ],
          ),
        ),
      );
    } else {
      return ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: vencimientoContratosModel!.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    child: ListTile(
                      subtitle: Text(
                        "Contrato vencerá el " +
                            DateFormat.MMMMd('es_MX').format(
                                DateFormat('dd/MM/yyyy', 'es_MX').parse(
                                    vencimientoContratosModel![index]
                                        .fecha
                                        .toString())),
                        style: TextStyle(color: Colors.red),
                      ),
                      title: Text(
                        vencimientoContratosModel![index].nombre.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      leading: Icon(
                        FontAwesomeIcons.user,
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
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
