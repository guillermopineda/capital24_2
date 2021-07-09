import 'package:capital24_2/src/models/capitalBenefits/serviciosCapitalBenefitsModel.dart';
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
    final TduServicios descuento =
        ModalRoute.of(context)!.settings.arguments as TduServicios;
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("C4U - Detalle"),
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
                      width: _screenSize.width * .95,
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: _screenSize.height * .02,
                            ),
                            Hero(
                              tag: descuento.comercio!.unicoId as Object,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  color: Colors.white,
                                  height: _screenSize.height * .3,
                                  child: Image(
                                    image: NetworkImage(
                                      descuento.comercio?.getImagenDirectorio(),
                                    ),
                                    height: _screenSize.height * .3,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: _screenSize.height * .02,
                            ),
                            Text(
                              descuento.comercio!.nombre as String,
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Theme.of(context).dividerColor,
                              ),
                            ),
                            SizedBox(
                              height: _screenSize.height * .02,
                            ),
                            Text(
                              descuento.beneficio!.promocorta as String,
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Theme.of(context).dividerColor,
                              ),
                            ),
                            SizedBox(
                              height: _screenSize.height * .035,
                            ),
                            GestureDetector(
                              onTap: () => _launchPaginaWeb(descuento),
                              child:
                                  Text(descuento.comercio!.paginaweb as String,
                                      style: TextStyle(
                                        color: Theme.of(context).dividerColor,
                                        fontSize: 16.0,
                                      )),
                            ),
                            SizedBox(
                              height: _screenSize.height * .02,
                            ),
                            Text("Términos:"),
                            Container(
                                width: _screenSize.width * .6,
                                child: Text(
                                  descuento.beneficio!.terminos as String,
                                  textAlign: TextAlign.center,
                                )),
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

  _launchPaginaWeb(TduServicios descuento) async {
    var s = descuento.comercio!.paginaweb!.replaceAll("/", "");
    var t = s.indexOf(":");
    var w = s.substring(t + 1);

    final paginaweb = 'http://$w';

    if (await canLaunch(paginaweb)) {
      await launch(paginaweb);
    } else {
      throw 'No es posible enviar al sitio $paginaweb';
    }
  }
}
