import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:capital24_2/src/providers/AltasBajasProvider.dart';
import 'package:capital24_2/src/widgets/appHamburguesaClienteEspejo.dart';
import 'package:capital24_2/src/widgets/appNoEmpleado.dart';
import 'package:capital24_2/src/widgets/appNoLogin.dart';
import 'package:capital24_2/src/widgets/appRotacionPersonal.dart';
import 'package:flutter/material.dart';

class RotacionPersonal extends StatelessWidget {
  static const String routeName = '/rotacionPersonal';

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
        return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
              title: Text("Rotación de Personal"),
              centerTitle: true,
              leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back)),
            ),
            endDrawer: HamburguesaClienteEspejo(),
            body: Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text(
                            "Consulta el % de forma anual  ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color),
                          ),
                          Icon(
                            Icons.touch_app,
                            color: Theme.of(context).dividerColor,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: _screenSize.height * .05,
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: _screenSize.height * .7,
                        width: double.infinity,
                        child: _grafica(),
                      ),
                    ),
                  ],
                ),
              ),
            ));
      }
    }
  }

  Widget _grafica() {
    return FutureBuilder(
        future: headcountProvider.getHeadcountNegocio(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return AppRotacionPersonal(rotacionModel: snapshot.data);
          } else {
            return Center(
                child: Image.asset(
              "images/load_2.gif",
            ));
          }
        });
  }
}
