import 'package:capital24_2/src/models/plantillaColaboradoresModel.dart';
import 'package:capital24_2/src/providers/PlantillaColaboradoresProvider.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ColaboradoresSearch extends SearchDelegate {
  final plantillaColaboradoresProvider = new PlantillaColaboradoresProvider();
  final List<PlantillaColaboradoresModel>? plantillaColaboradoresModel;
  ColaboradoresSearch({this.plantillaColaboradoresModel});

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

    if (plantillaColaboradoresModel == null) {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              "Cargando colaboradores. Por favor consulta nuevamente en unos segundos",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText1!.color,
              )),
        ],
      ));
    } else {
      final colaboradores = plantillaColaboradoresModel;
      final listaSugerida = (query.length == 0)
          ? colaboradores
          : colaboradores!
              .where(
                  (p) => p.nombre!.toLowerCase().contains(query.toLowerCase()))
              .toList();

      return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: listaSugerida!.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  subtitle: Text(
                      "ID: " + listaSugerida[index].numeroEmpleado.toString()),
                  title: Text(
                    listaSugerida[index].nombre.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Theme.of(context).dividerColor,
                  ),
                  onTap: () {
                    close(context, null);
                    Navigator.pushNamed(
                        context, '/plantillaColaboradoresDetalle',
                        arguments: listaSugerida[index]);
                  },
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

    if (plantillaColaboradoresModel == null) {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              "Cargando colaboradores. Por favor consulta nuevamente en unos segundos",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText1!.color,
              )),
        ],
      ));
    } else {
      final colaboradores = plantillaColaboradoresModel;
      final listaSugerida = (query.length == 0)
          ? colaboradores
          : colaboradores!
              .where(
                  (p) => p.nombre!.toLowerCase().contains(query.toLowerCase()))
              .toList();

      return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: listaSugerida!.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  subtitle: Text(
                      "ID: " + listaSugerida[index].numeroEmpleado.toString()),
                  title: Text(
                    listaSugerida[index].nombre ?? "Cargando...",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Theme.of(context).dividerColor,
                  ),
                  onTap: () {
                    close(context, null);
                    Navigator.pushNamed(
                        context, '/plantillaColaboradoresDetalle',
                        arguments: listaSugerida[index]);
                  },
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
