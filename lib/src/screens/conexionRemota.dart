import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:capital24_2/src/widgets/appHamburguesaEmpleadoEspejo.dart';
import 'package:capital24_2/src/widgets/appNoCliente.dart';
import 'package:capital24_2/src/widgets/appNoLogin.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConexionRemota extends StatelessWidget {
  static const String routeName = '/conexionRemota';

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final _prefs = PreferenciasUsuario();
    if (_prefs.tipoUsuario == '') {
      return NoLogin();
    } else {
      if (_prefs.tipoUsuario == 'cliente') {
        return NoCliente();
      } else {
        return Scaffold(
          appBar: AppBar(
            title: Text("Conexión Remota"),
            centerTitle: true,
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back)),
          ),
          endDrawer: HamburguesaEmpleadoEspejo(),
          backgroundColor: Theme.of(context).backgroundColor,
          body: SafeArea(
            bottom: true,
            maintainBottomViewPadding: true,
            child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: _screenSize.height * .03,
                      ),
                      _cardRegistro(context),
                      SizedBox(
                        height: _screenSize.height * .03,
                      ),
                      _cardBitracora(context),
                      SizedBox(
                        height: _screenSize.height * .03,
                      ),
                    ],
                  ),
                ]),
          ),
        );
      }
    }
  }

  Widget _cardRegistro(BuildContext context) {
    return Container(
        height: 80.0,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(
                  FontAwesomeIcons.streetView,
                  color: Theme.of(context).dividerColor,
                ),
                title: Text(
                  "Registro",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
                trailing: new Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).dividerColor,
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/sucursales');
                  //_location();
                },
              )
            ],
          ),
          elevation: 40.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        ));
  }

  Widget _cardBitracora(BuildContext context) {
    return Container(
        height: 80.0,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                  leading: Icon(
                    FontAwesomeIcons.calendarCheck,
                    color: Theme.of(context).dividerColor,
                  ),
                  title: Text(
                    "Bitácora",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                  ),
                  trailing: new Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).dividerColor,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/bitacora');
                  })
            ],
          ),
          elevation: 40.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        ));
  }
}
