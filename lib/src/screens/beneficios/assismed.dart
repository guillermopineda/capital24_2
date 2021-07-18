import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:capital24_2/src/widgets/appHamburguesaClienteEspejo.dart';
import 'package:capital24_2/src/widgets/appHamburguesaEmpleadoEspejo.dart';
import 'package:capital24_2/src/widgets/appNoLogin.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:url_launcher/url_launcher.dart';

class Asismed extends StatelessWidget {
  static const String routeName = '/asismed';
  final _prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    if (_prefs.tipoUsuario == '') {
      return NoLogin();
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Asismed"),
          centerTitle: true,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
        ),
        endDrawer: usuarioHamburguesa(),
        backgroundColor: Theme.of(context).backgroundColor,
        body: ListView(
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
                  _cardNotas(context),
                  SizedBox(
                    height: _screenSize.height * .03,
                  ),
                  _cardTelAsismed(context),
                  SizedBox(
                    height: _screenSize.height * .03,
                  ),
                  _cardPhoneAsismed(context),
                  SizedBox(
                    height: _screenSize.height * .03,
                  ),
                  _cardWebAsismed(context),
                  SizedBox(
                    height: _screenSize.height * .03,
                  ),
                ],
              ),
            ]),
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

  Widget _cardNotas(context) {
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
                  Icons.alternate_email,
                  color: Theme.of(context).dividerColor,
                ),
                title: Text(
                  "Dudas",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
                onTap: () => _launchmailasismed(),
              )
            ],
          ),
          elevation: 40.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        ));
  }

  Widget _cardTelAsismed(context) {
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
                  "(800) 228-02-44",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
                onTap: () => _launchtelefonoasismed(),
              )
            ],
          ),
          elevation: 40.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        ));
  }

  Widget _cardPhoneAsismed(context) {
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
                  "(55) 5350 - 7382",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
                onTap: () => _launchtelefonodosasismed(),
              )
            ],
          ),
          elevation: 40.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        ));
  }

  Widget _cardWebAsismed(context) {
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
                  FontAwesomeIcons.globeAmericas,
                  color: Theme.of(context).dividerColor,
                ),
                title: Text(
                  "www.asismed.com.mx",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
                onTap: () => _launchwebasismed(),
              )
            ],
          ),
          elevation: 40.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        ));
  }

  Future<void> _launchmailasismed() async {
    const mailasis =
        'mailto:contacto@asismed.com.mx?subject=Asistencia&body=Equipo%20Asismed,';
    if (await canLaunch(mailasis)) {
      await launch(mailasis);
    } else {
      throw 'No es posible conectar al correo $mailasis';
    }
  }

  Future<void> _launchtelefonoasismed() async {
    const telasismed = 'tel:8002280244';
    if (await canLaunch(telasismed)) {
      await launch(telasismed);
    } else {
      throw 'No es posible llamar al teléfono $telasismed';
    }
  }

  Future<void> _launchtelefonodosasismed() async {
    const phoneasismed = 'tel:5553507382';
    if (await canLaunch(phoneasismed)) {
      await launch(phoneasismed);
    } else {
      throw 'No es posible llamar al te $phoneasismed';
    }
  }

  Future<void> _launchwebasismed() async {
    const webasismed = 'https://www.asismed.com.mx/';
    if (await canLaunch(webasismed)) {
      await launch(webasismed);
    } else {
      throw 'No es posible enviar al sitio $webasismed';
    }
  }
}
