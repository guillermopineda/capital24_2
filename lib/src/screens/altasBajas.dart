import 'package:capital24_2/src/providers/AltasBajasProvider.dart';
import 'package:capital24_2/src/widgets/appAltasBajas.dart';
import 'package:capital24_2/src/widgets/appHamburguesaClienteEspejo.dart';
import 'package:flutter/material.dart';

class AltasBajas extends StatelessWidget {
  static const String routeName = '/altasBajas';

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text("Altas y Bajas"),
          centerTitle: true,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
        ),
        endDrawer: HamburguesaClienteEspejo(),
        body: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        "Consulta altas y bajas de colaboradores  ",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Icon(
                        Icons.touch_app,
                        color: Theme.of(context).dividerColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: _screenSize.height * .05,
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: _screenSize.height * .85,
                    width: double.infinity,
                    child: _graficaAltasBajas(),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _graficaAltasBajas() {
    return FutureBuilder(
        future: headcountProvider.getHeadcountNegocio(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return AppAltasBajas(altasBajasModel: snapshot.data);
          } else {
            return Center(
                child: Image.asset(
              "images/load_2.gif",
            ));
          }
        });
  }
}
