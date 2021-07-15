import 'dart:ui';

import 'package:capital24_2/src/models/capitalBenefits/descuentosCapitalModel.dart';
import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:capital24_2/src/widgets/appHamburguesaClienteEspejo.dart';
import 'package:capital24_2/src/widgets/appHamburguesaEmpleadoEspejo.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CapitalPartnersDirectorioDetalle extends StatelessWidget {
  static const String routeName = '/capitalPartnersDirectorioDetalle';
  final _prefs = PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    final DescuentoCapitalModel descuento =
        ModalRoute.of(context)!.settings.arguments as DescuentoCapitalModel;
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Beneficios - Detalle"),
          centerTitle: true,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
        ),
        endDrawer: usuarioHamburguesa(),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: _screenSize.height * .95,
                      width: _screenSize.width * .8,
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: _screenSize.height * .02,
                            ),
                            Hero(
                              tag: descuento.unicoId as Object,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  color: Colors.white,
                                  height: _screenSize.height * .3,
                                  child: Image(
                                    image: NetworkImage(
                                      descuento.getImagenLogo(),
                                    ),
                                    height: _screenSize.height * .3,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: _screenSize.height * .02,
                            ),
                            Column(
                              children: [
                                Text(
                                  descuento.marcaEstablecimeinto as String,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: Theme.of(context).dividerColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: _screenSize.height * .02,
                            ),
                            Text(
                              descuento.promocion as String,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            SizedBox(
                              height: _screenSize.height * .035,
                            ),
                            _conWeb(context, descuento),
                            SizedBox(
                              height: _screenSize.height * .02,
                            ),
                            Text("Términos:"),
                            Container(
                                width: _screenSize.width * .6,
                                child: Text(
                                  descuento.terminosCondiciones as String,
                                  textAlign: TextAlign.center,
                                )),
                            SizedBox(
                              height: _screenSize.height * .035,
                            ),
                            _conCatalogo(context, descuento)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  usuarioHamburguesa() {
    if (_prefs.tipoUsuario == 'empleado') {
      return HamburguesaEmpleadoEspejo();
    } else {
      return HamburguesaClienteEspejo();
    }
  }

  _launchPaginaWeb(DescuentoCapitalModel descuento) async {
    var s = descuento.paginaWeb!.replaceAll("/", "");
    var t = s.indexOf(":");
    var w = s.substring(t + 1);

    final paginaweb = 'http://$w';

    if (await canLaunch(paginaweb)) {
      await launch(paginaweb);
    } else {
      throw 'No es posible enviar al sitio $paginaweb';
    }
  }

  _launchCatalogo(DescuentoCapitalModel descuento) async {
    if (await canLaunch(descuento.catalogo!)) {
      await launch(descuento.catalogo!);
    } else {
      throw 'No es posible descargar el catálogo';
    }
  }

  Widget _conCatalogo(BuildContext context, DescuentoCapitalModel descuento) {
    if (descuento.catalogo == null) {
      return SizedBox(
        height: 1,
      );
    } else {
      return GestureDetector(
        onTap: () => _launchCatalogo(descuento),
        child: Text(
          'Descarga el Catálogo',
          style: TextStyle(color: Theme.of(context).dividerColor),
        ),
      );
    }
  }

  Widget _conWeb(BuildContext context, DescuentoCapitalModel descuento) {
    if (descuento.paginaWeb == null) {
      return SizedBox(
        height: 1,
      );
    } else {
      return GestureDetector(
        onTap: () => _launchPaginaWeb(descuento),
        child: Text(descuento.paginaWeb as String,
            style: TextStyle(
              color: Theme.of(context).dividerColor,
              fontSize: 16.0,
            )),
      );
    }
  }
}
