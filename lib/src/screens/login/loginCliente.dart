import 'package:capital24_2/src/bloc/login/LoginBloc.dart';
import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:capital24_2/src/providers/login/LoginClienteProvider.dart';
import 'package:capital24_2/src/providers/login/Provider.dart';
import 'package:capital24_2/src/utils/Utilerias.dart';
import 'package:capital24_2/src/widgets/appButton.dart';
import 'package:capital24_2/src/widgets/appSiCliente.dart';
import 'package:capital24_2/src/widgets/appSiEmpleado.dart';
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

  final loginsClienteProvider = new LoginsClienteProvider();

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
    final _prefs = PreferenciasUsuario();
    final bloc = ProviderLogin.of(context);
    final _screenSize = MediaQuery.of(context).size;
    if (_prefs.tipoUsuario == 'empleado') {
      return SiEmpleado();
    } else if (_prefs.tipoUsuario == 'cliente') {
      return SiCliente();
    } else {
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
                                final _prefs = PreferenciasUsuario();
                                bloc.changeUsernameCliente("           ");
                                bloc.changePasswordCliente("           ");
                                _prefs.deletePrefs();
                                Navigator.pop(context);
                                print(
                                    'Preferencias Cliente =${_prefs.tipoUsuario}');
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
                      _clienteUsuarioLogin(bloc),
                      _clienteNipLogin(bloc),
                      _botonClienteLogin(bloc),
                    ],
                  ),
                ),
              )),
        ),
      );
    }
  }

  Widget _clienteUsuarioLogin(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.usernameClienteStream,
        builder: (context, snapshot) {
          return AppFormField(
            hintText: "Ingresa tu Usuario",
            labelText: "Usuario",
            iconData: Icon(FontAwesomeIcons.user),
            onChanged: bloc.changeUsernameCliente,
            obscureText: false,
            controller: _clienteUsuarioController,
            textCapitalization: TextCapitalization.none,
            focusNode: _focusNode,
            maxLength: 16,
            errorText:
                snapshot.error != null ? snapshot.error.toString() : null,
          );
        });
  }

  Widget _clienteNipLogin(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.passwordClienteStream,
        builder: (context, snapshot) {
          return AppFormField(
            hintText: "9 Caracteres",
            labelText: "Contraseña",
            iconData: Icon(FontAwesomeIcons.lock),
            onChanged: bloc.changePasswordCliente,
            obscureText: true,
            controller: _clienteNipController,
            textCapitalization: TextCapitalization.none,
            focusNode: null,
            maxLength: 9,
            errorText:
                snapshot.error != null ? snapshot.error.toString() : null,
          );
        });
  }

  Widget _botonClienteLogin(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.loginClienteStream,
        builder: (context, snapshot) {
          return AppButton(
            name: 'Ingresar',
            onPressed:
                snapshot.hasData ? () => _loginCliente(bloc, context) : null,
          );
        });
  }

  Future _loginCliente(LoginBloc bloc, BuildContext context) async {
    final _prefs = PreferenciasUsuario();
    print('---------');
    print('UsernameCliente: ${bloc.usernameCliente}');
    print('PasswordCliente: ${bloc.passwordCliente}');
    print('---------');
    print(_prefs.tipoUsuario);
    Map info = await loginsClienteProvider.loginCliente(
        bloc.usernameCliente, bloc.passwordCliente);

    if (info['ok']) {
      Navigator.pushNamedAndRemoveUntil(
          context, '/homeCliente', (Route<dynamic> route) => false);
      _prefs.tipoUsuario = 'cliente';
      print(_prefs.tipoUsuario);
    } else {
      mostarAlerta(
          context, 'Por favor ingresa correctamente el usuario y/o contraseña');
    }
  }
}
