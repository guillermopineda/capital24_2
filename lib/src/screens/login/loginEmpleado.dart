import 'package:capital24_2/src/bloc/login/LoginBloc.dart';
import 'package:capital24_2/src/utils/Utilerias.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:capital24_2/src/providers/login/LoginEmpleadoProvider.dart';
//import 'package:capital24_2/src/utils/Utilerias.dart';
import 'package:capital24_2/src/widgets/appButton.dart';
import 'package:capital24_2/src/widgets/appForm.dart';
import 'package:capital24_2/src/widgets/appLogo.dart';
import 'package:capital24_2/src/providers/login/Provider.dart';

class LoginEmpleado extends StatefulWidget {
  static const String routeName = '/loginEmpleado';
  _LoginEmpleadoState createState() => _LoginEmpleadoState();
}

class _LoginEmpleadoState extends State<LoginEmpleado> {
  TextEditingController _empleadoUsuarioController = TextEditingController();
  TextEditingController _empleadoNipController = TextEditingController();
  FocusNode? _focusNode;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final loginsProvider = new LoginsProvider();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _empleadoUsuarioController = TextEditingController();
    _empleadoNipController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode?.dispose();
    _empleadoUsuarioController.dispose();
    _empleadoNipController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = ProviderLogin.of(context);
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
                              onTap: () {
                                bloc.changeUsername("                  ");
                                bloc.changePassword("                  ");
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back,
                                  color: Theme.of(context).dividerColor)),
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
                    _empleadoUsuarioLogin(bloc),
                    _empleadoNipLogin(bloc),
                    _botonEmpleadoLogin(bloc),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  Widget _empleadoUsuarioLogin(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.usernameStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return AppFormField(
            hintText: "Ingresa tu CURP",
            labelText: "Usuario",
            iconData: Icon(FontAwesomeIcons.user),
            onChanged: bloc.changeUsername,
            obscureText: false,
            controller: _empleadoUsuarioController,
            focusNode: null,
            textCapitalization: TextCapitalization.characters,
            maxLength: 18,
            errorText:
                snapshot.error != null ? snapshot.error.toString() : null,
          );
        });
  }

  Widget _empleadoNipLogin(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.passwordStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return AppFormField(
            hintText: "11 Caracteres",
            labelText: "Contraseña",
            iconData: Icon(FontAwesomeIcons.lock),
            onChanged: bloc.changePassword,
            obscureText: true,
            controller: _empleadoNipController,
            focusNode: null,
            textCapitalization: TextCapitalization.none,
            maxLength: 11,
            errorText:
                snapshot.error != null ? snapshot.error.toString() : null,
          );
        });
  }

  Widget _botonEmpleadoLogin(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.loginEmpleadoStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return AppButton(
            name: "Ingresar",
            onPressed:
                snapshot.hasData ? () => _loginEmpleado(bloc, context) : null,
          );
        });
  }

  Future _loginEmpleado(LoginBloc bloc, BuildContext context) async {
    print('=========');
    print('Username: ${bloc.username}');
    print('Password: ${bloc.password}');
    print('=========');
/* 
    Navigator.pushReplacementNamed(context, '/muro'); */
    Map info = await loginsProvider.loginUsuario(bloc.username, bloc.password);
    if (info['ok']) {
      Navigator.pushReplacementNamed(context, '/homeEmpleado');
    } else {
      mostarAlerta(
          context, 'Por favor ingresa correctamente el usuario y/o contraseña');
    }

    // if (info['ok']) {
    //   Navigator.pushReplacementNamed(context, '/homeEmpleado');
    // } else {
    //   mostarAlerta(
    //       context, 'Por favor ingresa correctamente el usuario y/o contraseña');
    // }
  }
}
