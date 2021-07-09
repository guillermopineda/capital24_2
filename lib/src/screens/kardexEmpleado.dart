import 'package:capital24_2/src/providers/KardexEmpleadoProvider.dart';
import 'package:capital24_2/src/widgets/appCalendarioKardexEmpleado.dart';
import 'package:capital24_2/src/widgets/appHamburguesaEmpleadoEspejo.dart';
import 'package:flutter/material.dart';

class KardexEmpleado extends StatelessWidget {
  static const String routeName = '/kardexEmpleado';
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Kardex"),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
      endDrawer: HamburguesaEmpleadoEspejo(),
      body: SafeArea(
        bottom: true,
        maintainBottomViewPadding: true,
        child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: _screenSize.height * .02,
                  ),
                  _calendarioKardex(),
                ],
              ),
            )),
      ),
    );
  }

  Widget _calendarioKardex() {
    return FutureBuilder(
        future: listaKardexEmpleadoProvider.getKardex(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return CalendarioKardexEmpleado(kardexEmpleadoModel: snapshot.data);
          } else {
            return Center(
                child: Image.asset(
              "images/load_2.gif",
            ));
          }
        });
  }
}
