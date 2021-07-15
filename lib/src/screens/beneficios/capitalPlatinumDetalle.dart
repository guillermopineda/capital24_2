import 'package:capital24_2/src/models/capitalBenefits/descuentosCapitalModel.dart';
import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:capital24_2/src/widgets/appHamburguesaClienteEspejo.dart';
import 'package:capital24_2/src/widgets/appHamburguesaEmpleadoEspejo.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:url_launcher/url_launcher.dart';

class CapitalPlatinumDetalle extends StatelessWidget {
  static const String routeName = '/capitalPlatinumDetalle';
  final _prefs = PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    final DescuentoCapitalModel listaDescuentoModel =
        ModalRoute.of(context)!.settings.arguments as DescuentoCapitalModel;
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Beneficios Detalle"),
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
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: _screenSize.height * .10),
                    _carruselImagenes(context, listaDescuentoModel),
                    _paginaWeb(context, listaDescuentoModel),
                  ],
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

  Widget _carruselImagenes(
      BuildContext context, DescuentoCapitalModel listaDescuentoModel) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
        width: double.infinity,
        height: size.height * .6,
        child: Carousel(
          boxFit: BoxFit.cover,
          autoplay: false,
          dotSize: 5.0,
          dotIncreasedColor: Theme.of(context).dividerColor,
          dotBgColor: Colors.transparent,
          dotColor: Theme.of(context).dividerColor,
          dotPosition: DotPosition.bottomCenter,
          dotVerticalPadding: 10.0,
          showIndicator: true,
          indicatorBgPadding: 7.0,
          images: [
            _cardPromo(context, listaDescuentoModel),
            _cardTerminos(context, listaDescuentoModel),
          ],
        ));
  }

  Widget _cardPromo(
      BuildContext context, DescuentoCapitalModel listaDescuentoModel) {
    return Container(
        child: Stack(children: <Widget>[
      Row(children: <Widget>[]),
      Center(child: listaDescuentoModel.getImagenVipA(context)),
    ]));
  }

  Widget _cardTerminos(
      BuildContext context, DescuentoCapitalModel listaDescuentoModel) {
    return Container(
        child: Stack(children: <Widget>[
      Row(children: <Widget>[]),
      Center(child: listaDescuentoModel.getImagenVipB(context)),
    ]));
  }

  Widget _paginaWeb(
      BuildContext context, DescuentoCapitalModel listaDescuentoModel) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        SizedBox(width: 10.0),
        GestureDetector(
          onTap: () => _launchWeb(listaDescuentoModel),
          child: Text(listaDescuentoModel.paginaWeb!,
              style: TextStyle(
                color: Theme.of(context).dividerColor,
                fontSize: 16.0,
              )),
        )
      ]),
    );
  }

  _launchWeb(DescuentoCapitalModel listaDescuentoModel) async {
    var s = listaDescuentoModel.paginaWeb!.replaceAll("/", "");
    var t = s.indexOf(":");
    var w = s.substring(t + 1);

    final paginaWeb = 'http://$w';
    if (await canLaunch(paginaWeb)) {
      await launch(paginaWeb);
    } else {
      throw 'No es posible enviar al sitio $paginaWeb';
    }
  }
}
