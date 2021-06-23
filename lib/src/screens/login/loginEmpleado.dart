import 'package:capital24_2/src/widgets/appButton.dart';
import 'package:capital24_2/src/widgets/appForm.dart';
import 'package:capital24_2/src/widgets/appLogo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginEmpleado extends StatefulWidget {
  static const String routeName = '/loginEmpleado';
  _LoginEmpleadoState createState() => _LoginEmpleadoState();
}

class _LoginEmpleadoState extends State<LoginEmpleado> {
  TextEditingController _empleadoUsuarioController = TextEditingController();
  TextEditingController _empleadoNipController = TextEditingController();
  FocusNode? _focusNode;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

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
    _focusNode!.dispose();
    _empleadoUsuarioController.dispose();
    _empleadoNipController.dispose();
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
                              onTap: () {
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
                    _empleadoUsuarioLogin(),
                    _empleadoNipLogin(),
                    _botonEmpleadoLogin(),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  Widget _empleadoUsuarioLogin() {
    return AppFormField(
      hintText: "Ingresa tu CURP",
      labelText: "Usuario",
      iconData: Icon(FontAwesomeIcons.user),
      onChanged: null,
      obscureText: false,
      controller: _empleadoUsuarioController,
      focusNode: null,
      textCapitalization: TextCapitalization.characters,
      maxLength: 18,
      errorText: null,
    );
  }

  Widget _empleadoNipLogin() {
    return AppFormField(
      hintText: "11 Caracteres",
      labelText: "Contraseña",
      iconData: Icon(FontAwesomeIcons.lock),
      onChanged: null,
      obscureText: true,
      controller: _empleadoNipController,
      focusNode: null,
      textCapitalization: TextCapitalization.none,
      maxLength: 11,
      errorText: null,
    );
  }

  Widget _botonEmpleadoLogin() {
    return AppButton(
      name: "Ingresar",
      onPressed: () {
        Navigator.pushNamed(context, '/homeEmpleado');
      },
    );
  }
}
