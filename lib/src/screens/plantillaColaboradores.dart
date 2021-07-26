import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:capital24_2/src/providers/PlantillaColaboradoresProvider.dart';
import 'package:capital24_2/src/utils/SearchDelegate.dart';
import 'package:capital24_2/src/widgets/appHamburguesaClienteEspejo.dart';
import 'package:capital24_2/src/widgets/appNoEmpleado.dart';
import 'package:capital24_2/src/widgets/appNoLogin.dart';
import 'package:capital24_2/src/widgets/appPlantillaColaboradores.dart';
import 'package:flutter/material.dart';

class PlantillaColaboradores extends StatelessWidget {
  static const String routeName = '/colaboradores';
  @override
  Widget build(BuildContext context) {
    final _prefs = PreferenciasUsuario();
    final _screenSize = MediaQuery.of(context).size;
    if (_prefs.tipoUsuario == '') {
      return NoLogin();
    } else {
      if (_prefs.tipoUsuario == 'empleado') {
        return NoEmpleado();
      } else {
        return FutureBuilder(
            future: plantillaColaboradoresProvider.getPlantillaColaboradores(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Scaffold(
                backgroundColor: Theme.of(context).backgroundColor,
                appBar: AppBar(
                  title: Text("Colaboradores"),
                  leading: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/homeCliente');
                      },
                      child: Icon(Icons.arrow_back)),
                  centerTitle: true,
                  actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          showSearch(
                            context: context,
                            delegate: ColaboradoresSearch(
                                plantillaColaboradoresModel: snapshot.data),
                          );
                        })
                  ],
                ),
                endDrawer: HamburguesaClienteEspejo(),
                body: SafeArea(
                  bottom: true,
                  maintainBottomViewPadding: true,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: _screenSize.height * .85,
                            child: ListView(
                              padding: EdgeInsets.symmetric(horizontal: 15.0),
                              children: <Widget>[
                                Container(
                                  child: (snapshot.hasData
                                      ? AppTarjetaPlantillaColaboradores(
                                          plantillaColaboradoresModel:
                                              snapshot.data)
                                      : Container(
                                          height: _screenSize.height * .85,
                                          child: Center(
                                              child: Image.asset(
                                            "images/load_2.gif",
                                          )))),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            });
      }
    }
  }
}
