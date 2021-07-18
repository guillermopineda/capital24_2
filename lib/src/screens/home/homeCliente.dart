import 'package:capital24_2/src/models/comunicadoClienteModel.dart';
import 'package:capital24_2/src/models/cumpleanioClienteModel.dart';
import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:capital24_2/src/providers/ComunicadoClienteProvider.dart';
import 'package:capital24_2/src/providers/CumpleanioClienteProvider.dart';
import 'package:capital24_2/src/utils/Tema.dart';
import 'package:capital24_2/src/widgets/appCumpleaniosCliente.dart';
import 'package:capital24_2/src/widgets/appHamburguesaCliente.dart';
import 'package:capital24_2/src/widgets/appHamburguesaEmpleado.dart';
import 'package:capital24_2/src/widgets/appNoEmpleado.dart';
import 'package:capital24_2/src/widgets/appNoLogin.dart';
import 'package:capital24_2/src/widgets/appTarjetaComunicadosCliente.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomeCliente extends StatefulWidget {
  static const String routeName = '/homeCliente';
  _HomeClienteState createState() => _HomeClienteState();
}

class _HomeClienteState extends State<HomeCliente> {
  final _prefs = PreferenciasUsuario();
  bool shouldPop = true;
  @override
  Widget build(BuildContext context) {
    if (_prefs.tipoUsuario == '') {
      return NoLogin();
    } else {
      if (_prefs.tipoUsuario == 'empleado') {
        return NoEmpleado();
      } else {
        return WillPopScope(
          onWillPop: () async {
            return shouldPop;
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text("Mi Muro"),
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.birthdayCake,
                  ),
                  onPressed: () => _listaCumpleanios(context),
                  autofocus: false,
                )
              ],
            ),
            drawer: usuarioHamburguesa(),
            floatingActionButton: FloatingActionButton(
              child: Icon(FontAwesomeIcons.paintBrush),
              //onPressed: ()=> _tema.setTema(miTemaObscuro),
              onPressed: () => _cambioTema(),
            ),
            body: SafeArea(
              bottom: true,
              maintainBottomViewPadding: true,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      _muroTarjetas(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }
  }

  usuarioHamburguesa() {
    if (_prefs.tipoUsuario == 'empleado') {
      return HamburguesaEmpleado();
    } else {
      return HamburguesaCliente();
    }
  }

  Widget _muroTarjetas() {
    final _screenSize = MediaQuery.of(context).size;
    final comunicadoProvider = ComunicadoProvider();
    return FutureBuilder(
      future: comunicadoProvider.getComunicado(),
      builder: (BuildContext context,
          AsyncSnapshot<List<ComunicadoModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          print(_prefs.tipoUsuario);
          return TarjetaComunicadoCliente(comunicadoModel: snapshot.data);
        } else {
          return Container(
              height: _screenSize.height * .85,
              child: Center(
                  child: Image.asset(
                "images/load_2.gif",
              )));
        }
      },
    );
  }

  Widget _muroCumpleanio() {
    final _screenSize = MediaQuery.of(context).size;
    return FutureBuilder(
      future: cumpleanioProvider.getCumpleanio(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return AlertaCumpleaniosCliente(
              cumpleanioModel: snapshot.data as List<CumpleanioModel>);
        } else {
          return Container(
              height: _screenSize.height * .85,
              child: Center(
                  child: Image.asset(
                "images/load_2.gif",
              )));
        }
      },
    );
  }

  void _listaCumpleanios(context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return _muroCumpleanio();
        });
  }

  void _cambioTema() {
    TemaSwitch _tema = Provider.of<TemaSwitch>(context, listen: false);
    final _screenSize = MediaQuery.of(context).size;
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Theme.of(context).indicatorColor,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: _screenSize.height * .1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.lightbulb,
                                color: Color(0xff0077C8),
                                size: 40,
                              ),
                              Text(
                                "Claro",
                                style: TextStyle(color: Color(0xff0077C8)),
                              ),
                            ],
                          ),
                          onTap: () => _tema.setTema(miTema),
                        ),
                        GestureDetector(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.solidLightbulb,
                                color: Color(0xff0077C8),
                                size: 40,
                              ),
                              Text(
                                "Oscuro",
                                style: TextStyle(color: Color(0xff0077C8)),
                              ),
                            ],
                          ),
                          onTap: () => _tema.setTema(miTemaObscuro),
                        )
                      ],
                    ),
                  )
                ],
              ));
        });
  }
}
