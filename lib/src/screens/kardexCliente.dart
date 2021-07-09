import 'package:capital24_2/src/providers/KardexClienteProvider.dart';
import 'package:capital24_2/src/widgets/appHamburguesaClienteEspejo.dart';
import 'package:capital24_2/src/widgets/appKardexCliente.dart';
import 'package:flutter/material.dart';

class KardexCliente extends StatelessWidget {
  static const String routeName = '/kardexCliente';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text("Kardex Cliente"),
          centerTitle: true,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
        ),
        endDrawer: HamburguesaClienteEspejo(),
        body: SafeArea(
          bottom: true,
          maintainBottomViewPadding: true,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            children: <Widget>[
              SizedBox(
                height: 15.0,
              ),
              _selectorPeriodosKardex(context),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ));
  }

  Widget _selectorPeriodosKardex(context) {
    final _screenSize = MediaQuery.of(context).size;
    return FutureBuilder(
        future: kardexClienteProvider.getKardexCliente(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return AppKardexCliente(kardexClienteModel: snapshot.data);
          } else {
            return Center(
                child: Container(
                    height: _screenSize.height * .85,
                    child: Image.asset(
                      "images/load_2.gif",
                    )));
          }
        });
  }
}
