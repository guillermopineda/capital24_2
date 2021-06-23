import 'package:capital24_2/src/widgets/appButton.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:capital24_2/src/widgets/appForm.dart';
import 'package:capital24_2/src/widgets/appLogo.dart';

class LoginCliente extends StatefulWidget {
  static const String routeName = '/loginCliente';
  _LoginClienteState createState() => _LoginClienteState();
}

class _LoginClienteState extends State<LoginCliente> {
  TextEditingController _clienteUsuarioController = TextEditingController();
  TextEditingController _clienteNipController = TextEditingController();
  FocusNode? _focusNode;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _focusNode = FocusNode();
    _clienteUsuarioController = TextEditingController();
    _clienteNipController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _focusNode!.dispose();
    _clienteUsuarioController.dispose();
    _clienteNipController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Form(
            key: _formkey,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: _screenSize.height * .05,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          GestureDetector(
                            child: Icon(
                              Icons.arrow_back,
                              color: Theme.of(context).dividerColor,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: _screenSize.height * .05,
                    ),
                    AppLogo(),
                    SizedBox(
                      height: _screenSize.height * .05,
                    ),
                    _clienteUsuarioLogin(),
                    _clienteNipLogin(),
                    _botonClienteLogin(),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  Widget _clienteUsuarioLogin() {
    return AppFormField(
      hintText: "Ingresa tu Usuario",
      labelText: "Usuario",
      iconData: Icon(FontAwesomeIcons.user),
      onChanged: null,
      obscureText: false,
      controller: _clienteUsuarioController,
      textCapitalization: TextCapitalization.none,
      focusNode: _focusNode,
      maxLength: 16,
      errorText: null,
    );
  }

  Widget _clienteNipLogin() {
    return AppFormField(
      hintText: "9 Caracteres",
      labelText: "Contraseña",
      iconData: Icon(FontAwesomeIcons.lock),
      onChanged: null,
      obscureText: true,
      controller: _clienteNipController,
      textCapitalization: TextCapitalization.none,
      focusNode: null,
      maxLength: 9,
      errorText: null,
    );
  }

  Widget _botonClienteLogin() {
    return AppButton(
        name: 'Ingresar',
        onPressed: () {
          Navigator.pushNamed(context, '/homeCliente');
        });
  }
}
