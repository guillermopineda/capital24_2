import 'package:capital24_2/src/providers/IndicadoresNegocioProvider.dart';
import 'package:capital24_2/src/widgets/appCostoPeriodo.dart';
import 'package:capital24_2/src/widgets/appHamburguesaClienteEspejo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IndicadoresNegocio extends StatelessWidget {
  static const String routeName = '/indicadoresNegocio';
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Indicadores de Negocio"),
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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: _screenSize.height * .03,
                  ),
                  _cardAcumulados(context),
                  SizedBox(
                    height: _screenSize.height * .03,
                  ),
                  _cardAltasBajas(context),
                  SizedBox(
                    height: _screenSize.height * .03,
                  ),
                  _cardRotacionPersonal(context),
                  SizedBox(
                    height: _screenSize.height * .03,
                  ),
                  _cardHeadcount(context),
                  SizedBox(
                    height: _screenSize.height * .03,
                  ),
                ],
              ),
            ]),
      ),
    );
  }

  Widget _cardAcumulados(context) {
    final _screenSize = MediaQuery.of(context).size;

    return FutureBuilder(
        future: costoPeriodoProvider.getIndicadorNegocio(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return AppCostoPeriodo(indicadorNegocioModel: snapshot.data);
          } else {
            return Container(
                height: _screenSize.height * .85,
                child: Center(
                    child: Image.asset(
                  "images/load_2.gif",
                )));
          }
        });
  }

  Widget _cardAltasBajas(BuildContext context) {
    return Container(
        height: 80.0,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.thumbs_up_down,
                  color: Theme.of(context).dividerColor,
                ),
                title: Text(
                  "Altas y Bajas",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
                trailing: new Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).dividerColor,
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/altasBajas');
                },
              )
            ],
          ),
          elevation: 40.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        ));
  }

  Widget _cardRotacionPersonal(BuildContext context) {
    return Container(
        height: 80.0,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(
                  FontAwesomeIcons.syncAlt,
                  color: Theme.of(context).dividerColor,
                ),
                title: Text(
                  "Rotación de Personal",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
                trailing: new Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).dividerColor,
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/rotacionPersonal');
                },
              )
            ],
          ),
          elevation: 40.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        ));
  }

  Widget _cardHeadcount(BuildContext context) {
    return Container(
        height: 80.0,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(
                  FontAwesomeIcons.users,
                  color: Theme.of(context).dividerColor,
                ),
                title: Text(
                  "Headcount",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
                trailing: new Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).dividerColor,
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/headcount');
                },
              )
            ],
          ),
          elevation: 40.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        ));
  }
}
