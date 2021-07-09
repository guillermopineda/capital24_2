import 'package:capital24_2/src/models/vencimientoContratosModel.dart';
import 'package:capital24_2/src/providers/VencimientoContratosProvider.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart' show DateFormat;

class VencimientoSearch extends SearchDelegate {
  final vencimientoContratosProvider = new VencimientoContratosProvider();
  final List<VencimientoContratosModel>? vencimientoContratosModel;
  VencimientoSearch({this.vencimientoContratosModel});

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return theme;
  }

  @override
  String get searchFieldLabel => 'Nombre';
  TextInputType get keyboardType => TextInputType.text;

  @override
  List<Widget> buildActions(BuildContext context) {
    // Las acciones del AppBar
    return [
      IconButton(
          icon: Icon(FontAwesomeIcons.redoAlt),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del AppBar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // La instrcción que muestra los resulatados

    if (vencimientoContratosModel == null) {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              "Cargando colaboradores con contratos por vencer. Por favor consulta nuevamente en unos segundos",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText1!.color,
              )),
        ],
      ));
    } else {
      final colaboradores = vencimientoContratosModel;
      final listaSugerida = (query.isEmpty)
          ? []
          : colaboradores!
              .where(
                  (p) => p.nombre!.toLowerCase().contains(query.toLowerCase()))
              .toList();

      return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: listaSugerida.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  subtitle: Text(
                    "Contrato vencerá el " +
                        DateFormat.MMMMd('es_MX').format(
                            DateFormat('dd/MM/yyyy', 'es_MX')
                                .parse(listaSugerida[index].fecha)),
                    style: TextStyle(color: Colors.red),
                  ),
                  title: Text(
                    listaSugerida[index].nombre,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: Icon(
                    FontAwesomeIcons.user,
                    color: Theme.of(context).dividerColor,
                  ),
                ),
                new Divider(
                  color: Theme.of(context).dividerColor,
                ),
              ],
            ),
          );
        },
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Las sugerencias que aparecen en la búsqueda

    if (vencimientoContratosModel == null) {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              "Cargando colaboradores con contratos por vencer. Por favor consulta nuevamente en unos segundos",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText1!.color,
              )),
        ],
      ));
    } else {
      final colaboradores = vencimientoContratosModel;

      final listaSugerida = (query.isEmpty)
          ? []
          : colaboradores!
              .where(
                  (p) => p.nombre!.toLowerCase().contains(query.toLowerCase()))
              .toList();
      return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: listaSugerida.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  subtitle: Text(
                    "Contrato vencerá el " +
                        DateFormat.MMMMd('es_MX').format(
                            DateFormat('dd/MM/yyyy', 'es_MX')
                                .parse(listaSugerida[index].fecha)),
                    style: TextStyle(color: Colors.red),
                  ),
                  title: Text(
                    listaSugerida[index].nombre,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: Icon(
                    FontAwesomeIcons.user,
                    color: Theme.of(context).dividerColor,
                  ),
                ),
                new Divider(
                  color: Theme.of(context).dividerColor,
                ),
              ],
            ),
          );
        },
      );
    }
  }
}
