import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:capital24_2/src/providers/VencimientoContratosProvider.dart';
import 'package:capital24_2/src/utils/SearchDelegateContratos.dart';
import 'package:capital24_2/src/widgets/appHamburguesaClienteEspejo.dart';
import 'package:capital24_2/src/widgets/appNoEmpleado.dart';
import 'package:capital24_2/src/widgets/appNoLogin.dart';
import 'package:capital24_2/src/widgets/appVencimientoContratos.dart';
import 'package:flutter/material.dart';

class VencimientoContrato extends StatelessWidget {
  static const String routeName = '/vencimientoContrato';
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
            future: vencimientoContratosProvider.getVencimiento(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Scaffold(
                backgroundColor: Theme.of(context).backgroundColor,
                appBar: AppBar(
                  title: Text("Vencimiento Contrato"),
                  centerTitle: true,
                  actions: [
                    IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          showSearch(
                            context: context,
                            delegate: VencimientoSearch(
                                vencimientoContratosModel: snapshot.data),
                          );
                        })
                  ],
                  leading: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back)),
                ),
                endDrawer: HamburguesaClienteEspejo(),
                body: SafeArea(
                    bottom: true,
                    maintainBottomViewPadding: true,
                    child: Container(
                      height: _screenSize.height * .85,
                      child: ListView(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          children: <Widget>[
                            Container(
                                child: (snapshot.hasData
                                    ? AppVencimientoContratos(
                                        vencimientoContratosModel:
                                            snapshot.data)
                                    : Center(
                                        child: Container(
                                            height: _screenSize.height * .85,
                                            child: Image.asset(
                                              "images/load_2.gif",
                                            )))))
                          ]),
                    )),
              );
            });
      }
    }
  }
}
