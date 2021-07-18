import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:capital24_2/src/widgets/appHamburguesaClienteEspejo.dart';
import 'package:capital24_2/src/widgets/appHamburguesaEmpleadoEspejo.dart';
import 'package:capital24_2/src/widgets/appNoLogin.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:url_launcher/url_launcher.dart';

class AtencionClientes extends StatelessWidget {
  static const String routeName = '/atencionClientes';
  final _prefs = PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    if (_prefs.tipoUsuario == '') {
      return NoLogin();
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Atención a Clientes"),
          centerTitle: true,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
        ),
        endDrawer: usuarioHamburguesa(),
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          bottom: true,
          maintainBottomViewPadding: true,
          child: Stack(
            children: <Widget>[
              ListView(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  children: <Widget>[
                    SizedBox(
                      height: _screenSize.height * .03,
                    ),
                    _cardContacto(context),
                    SizedBox(
                      height: _screenSize.height * .03,
                    ),
                    _cardEmail(context)
                  ])
            ],
          ),
        ),
      );
    }
  }

  usuarioHamburguesa() {
    if (_prefs.tipoUsuario == 'empleado') {
      return HamburguesaEmpleadoEspejo();
    } else {
      return HamburguesaClienteEspejo();
    }
  }

  Widget _cardContacto(context) {
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
                  FontAwesomeIcons.headset,
                  color: Theme.of(context).dividerColor,
                ),
                title: Text(
                  "(55) 5276 - 8570",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
                onTap: () => _launchtelefono(),
              )
            ],
          ),
          elevation: 40.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        ));
  }

  Widget _cardEmail(context) {
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
                  FontAwesomeIcons.envelope,
                  color: Theme.of(context).dividerColor,
                ),
                title: Text(
                  "ayuda@capital24.mx",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
                onTap: () => _launchmail(),
              )
            ],
          ),
          elevation: 40.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        ));
  }

  Future<void> _launchtelefono() async {
    const tel = 'tel:5552768570';
    if (await canLaunch(tel)) {
      await launch(tel);
    } else {
      throw 'Ne es posible llamar al telefono $tel';
    }
  }

  Future<void> _launchmail() async {
    const mail =
        'mailto:ayuda@capital24.mx?subject=Capital24&body=Equipo%20Capital24,';
    if (await canLaunch(mail)) {
      await launch(mail);
    } else {
      throw 'No es posible conectar al correo $mail';
    }
  }
}
