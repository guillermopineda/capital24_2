import 'package:capital24_2/src/widgets/appCumpleaniosEmpleado.dart';
import 'package:capital24_2/src/widgets/appHamburguesaEmpleado.dart';
import 'package:capital24_2/src/widgets/appTarjetaComunicadosEmpleado.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeEmpleado extends StatefulWidget {
  static const String routeName = '/homeEmpleado';
  _HomeEmpleadoState createState() => _HomeEmpleadoState();
}

class _HomeEmpleadoState extends State<HomeEmpleado> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: null,
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

  usuarioHamburguesa() {
    return HamburguesaEmpleado();
  }

  Widget _muroTarjetas() {
    return TarjetaComunicadoEmpleado();
  }

  void _listaCumpleanios(context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return _muroCumpleanio();
        });
  }

  Widget _muroCumpleanio() {
    return AlertaCumpleaniosEmpleado();
  }

  void _cambioTema() {
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
                          onTap: () => null,
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
                          onTap: () => null,
                        )
                      ],
                    ),
                  )
                ],
              ));
        });
  }
}
