import 'package:capital24_2/src/providers/InformacionContactoProvider.dart';
import 'package:capital24_2/src/providers/InformacionDomicilioProvider.dart';
import 'package:capital24_2/src/providers/InformacionPersonalProvider.dart';
import 'package:capital24_2/src/widgets/appHamburguesaEmpleadoEspejo.dart';
import 'package:capital24_2/src/widgets/appTarjetaDatoContactoEmpleado.dart';
import 'package:capital24_2/src/widgets/appTarjetaDatoDomicilioEmpleado.dart';
import 'package:capital24_2/src/widgets/appTarjetaDatoPersonalEmpleado.dart';
import 'package:flutter/material.dart';

class InformacionPersonal extends StatefulWidget {
  static const String routeName = '/informacionPersonal';
  _InformacionPersonalState createState() => _InformacionPersonalState();
}

class _InformacionPersonalState extends State<InformacionPersonal> {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
          title: Text("Información Personal"),
          centerTitle: true,
        ),
        endDrawer: HamburguesaEmpleadoEspejo(),
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          bottom: true,
          maintainBottomViewPadding: true,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SizedBox(
              height: _screenSize.height * .85,
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
                      _datoPersonal(context),
                      SizedBox(
                        height: _screenSize.height * .03,
                      ),
                      _datoContacto(context),
                      SizedBox(
                        height: _screenSize.height * .03,
                      ),
                      _datoDomicilio(context),
                      SizedBox(
                        height: _screenSize.height * .03,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _datoPersonal(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return FutureBuilder(
      future: datoPersonalEmpleadoProvider.getDatoPersonal(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return AppTarjetaDatoPersonalEmpleado(
              datoPersonalEmpleadoModel: snapshot.data);
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

  Widget _datoDomicilio(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return FutureBuilder(
      future: datoDomicilioEmpleadoProvider.getDatoDomicilio(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return AppTarjetaDatoDomicilioEmpleado(
              datoDomicilioEmpleadoModel: snapshot.data);
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

  Widget _datoContacto(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return FutureBuilder(
      future: datoContactoEmpleadoProvider.getDatoContacto(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return AppTarjetaDatoContactoEmpleado(
              datoContactoEmpleadoModel: snapshot.data);
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
}
