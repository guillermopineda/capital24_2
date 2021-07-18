import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:capital24_2/src/widgets/appSiCliente.dart';
import 'package:capital24_2/src/widgets/appSiEmpleado.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:capital24_2/src/widgets/appButton.dart';
import 'package:capital24_2/src/widgets/appLogo.dart';

class LoginInicio extends StatefulWidget {
  static const String routeName = '/loginInicio';
  LoginInicio({Key? key}) : super(key: key);

  @override
  __LoginInicioState createState() => __LoginInicioState();
}

class __LoginInicioState extends State<LoginInicio> {
  TextEditingController _clienteUsuarioController = TextEditingController();
  TextEditingController _clienteNipController = TextEditingController();
  TextEditingController _empleadoCiaController = TextEditingController();
  TextEditingController _empleadoUsuarioController = TextEditingController();
  TextEditingController _empleadoNipController = TextEditingController();
  FocusNode? _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _clienteUsuarioController = TextEditingController();
    _clienteNipController = TextEditingController();
    _empleadoCiaController = TextEditingController();
    _empleadoUsuarioController = TextEditingController();
    _empleadoNipController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode?.dispose();
    _clienteUsuarioController.dispose();
    _clienteNipController.dispose();
    _empleadoCiaController.dispose();
    _empleadoUsuarioController.dispose();
    _empleadoNipController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final _prefs = PreferenciasUsuario();
    if (_prefs.tipoUsuario == 'empleado') {
      return SiEmpleado();
    } else if (_prefs.tipoUsuario == 'cliente') {
      return SiCliente();
    } else {
      return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: _screenSize.height * .15),
                  AppLogo(),
                  SizedBox(height: _screenSize.height * .05),
                  _botonEmpleado(),
                  _botonCliente(),
                  SizedBox(height: _screenSize.height * .05),
                  GestureDetector(
                    child: Text(
                      'Crear cuenta nueva',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.solid),
                    ),
                    onTap: () => _launchNuevoRegistro(),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _botonEmpleado() {
    return AppButton(
      name: "Colaborador",
      onPressed: () {
        Navigator.pushNamed(context, '/loginEmpleado');
        FocusScope.of(context).requestFocus(_focusNode);
        _empleadoCiaController.text = "";
        _empleadoUsuarioController.text = "";
        _empleadoNipController.text = "";
      },
    );
  }

  Widget _botonCliente() {
    return AppButton(
        name: "Cliente / Aliado",
        onPressed: () {
          Navigator.pushNamed(context, '/loginCliente');
          FocusScope.of(context).requestFocus(_focusNode);
          _clienteUsuarioController.text = "";
          _clienteNipController.text = "";
        });
  }

  Future<void> _launchNuevoRegistro() async {
    const nuevoRegistro = 'https://capital24.mx/registro/';
    if (await canLaunch(nuevoRegistro)) {
      await launch(nuevoRegistro);
    } else {
      throw 'No es posible enviar al sitio $nuevoRegistro';
    }
  }
}
