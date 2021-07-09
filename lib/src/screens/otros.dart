import 'package:capital24_2/src/models/otrosModel.dart';
import 'package:capital24_2/src/providers/OtrosProvider.dart';
import 'package:capital24_2/src/widgets/appHamburguesaEmpleadoEspejo.dart';
import 'package:capital24_2/src/widgets/appOtrosEmpleado.dart';
import 'package:flutter/material.dart';

class Otros extends StatefulWidget {
  static const String routeName = '/otros';
  _OtrosState createState() => _OtrosState();
}

class _OtrosState extends State<Otros> {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Otros Pagos"),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
      endDrawer: HamburguesaEmpleadoEspejo(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        bottom: true,
        maintainBottomViewPadding: true,
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
                _selectorOtros(),
                SizedBox(
                  height: _screenSize.height * .03,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _selectorOtros() {
    final _screenSize = MediaQuery.of(context).size;

    return FutureBuilder(
      future: desglosesOtroProvider.getDesgloseOtro(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return AppOtrosEmpleado(
              desglosesOtroModel: snapshot.data as List<DesgloseOtroModel>);
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
