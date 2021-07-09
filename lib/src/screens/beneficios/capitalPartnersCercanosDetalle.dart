import 'package:capital24_2/src/models/capitalBenefits/localizacionCapitalBenefitsModel.dart';
import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:capital24_2/src/widgets/appHamburguesaClienteEspejo.dart';
import 'package:capital24_2/src/widgets/appHamburguesaEmpleadoEspejo.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class CapitalPartnersCercanosDetalle extends StatelessWidget {
  static const String routeName = '/capitalPartnersCercanosDetalle';
  final _prefs = PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    final TduLocalizacion descuentoCercano =
        ModalRoute.of(context)!.settings.arguments as TduLocalizacion;
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Capital Partners Detalle"),
          centerTitle: true,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
        ),
        endDrawer: usuarioHamburguesa(),
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          bottom: true,
          maintainBottomViewPadding: true,
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: _screenSize.height * .95,
                        width: _screenSize.width * .95,
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: _screenSize.height * .02,
                              ),
                              Hero(
                                tag: descuentoCercano.comercio!.unicoId
                                    as Object,
                                transitionOnUserGestures: false,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Container(
                                    color: Colors.white,
                                    height: _screenSize.height * .3,
                                    child: SingleChildScrollView(
                                      child: Image(
                                        image: NetworkImage(
                                          descuentoCercano.comercio
                                              ?.getImagenCercano(),
                                        ),
                                        height: _screenSize.height * .3,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: _screenSize.height * .02,
                              ),
                              Text(
                                descuentoCercano.comercio!.nombre as String,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Theme.of(context).dividerColor,
                                ),
                              ),
                              SizedBox(
                                height: _screenSize.height * .02,
                              ),
                              Text(
                                descuentoCercano.beneficio!.promocorta
                                    as String,
                                style: TextStyle(
                                    fontSize: 22.0,
                                    color: Theme.of(context).accentColor),
                              ),
                              SizedBox(
                                height: _screenSize.height * .035,
                              ),
                              GestureDetector(
                                onTap: () => _launchPaginaWeb(descuentoCercano),
                                child: Text(
                                    descuentoCercano.comercio!.paginaweb
                                        as String,
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16.0,
                                    )),
                              ),
                              SizedBox(
                                height: _screenSize.height * .02,
                              ),
                              Text("Términos:"),
                              Container(
                                  width: _screenSize.width * .6,
                                  height: _screenSize.height * .1,
                                  child: SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    child: Text(
                                      descuentoCercano.beneficio!.terminos
                                          as String,
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                              SizedBox(
                                height: _screenSize.height * .01,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/capitalPartnersCercanosMapa',
                                      arguments: descuentoCercano);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  width: _screenSize.width * .4,
                                  height: _screenSize.height * .1,
                                  child: Card(
                                      elevation: 40.0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      child: Center(
                                          child: Text("Mapa",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .dividerColor,
                                                  fontSize: 20.0,
                                                  fontWeight:
                                                      FontWeight.bold)))),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  usuarioHamburguesa() {
    if (_prefs.tipoUsuario == 'empleado') {
      return HamburguesaEmpleadoEspejo();
    } else {
      return HamburguesaClienteEspejo();
    }
  }

  Future<void> _launchPaginaWeb(TduLocalizacion descuentoCercano) async {
    final paginaweb = 'http://${descuentoCercano.comercio!.paginaweb}';
    if (await canLaunch(paginaweb)) {
      await launch(paginaweb);
    } else {
      throw 'No es posible enviar al sitio $paginaweb';
    }
  }
}
