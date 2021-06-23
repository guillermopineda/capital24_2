import 'package:capital24_2/src/models/capitalBenefits/capitalPlatinumModel.dart';
import 'package:capital24_2/src/widgets/appHamburguesaEmpleadoEspejo.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:url_launcher/url_launcher.dart';

class CapitalPlatinumDetalle extends StatelessWidget {
  static const String routeName = '/capitalPlatinumDetalle';
  @override
  Widget build(BuildContext context) {
    final DirectorioModel listaHotDealsModel =
        ModalRoute.of(context)!.settings.arguments as DirectorioModel;
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Capital Platinum Detalle"),
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
                    _carruselImagenes(context, listaHotDealsModel),
                    _paginaWeb(context, listaHotDealsModel),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  usuarioHamburguesa() {
    //if (_prefs.tipoUsuario == 'empleado') {
    if (1 > 0) {
      return HamburguesaEmpleadoEspejo();
    } else {
      return; //HamburguesaClienteEspejo();
    }
  }

  Widget _carruselImagenes(
      BuildContext context, DirectorioModel listaHotDealsModel) {
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
            _cardPromo(context, listaHotDealsModel),
            _cardTerminos(context, listaHotDealsModel),
          ],
        ));
  }

  Widget _cardPromo(BuildContext context, DirectorioModel listaHotDealsModel) {
    final size = MediaQuery.of(context).size;
    return Container(
        child: Stack(children: <Widget>[
      Row(children: <Widget>[]),
      Center(
        child: Image.network(
          listaHotDealsModel.beneficio?.hotdeal?.imagenes?[1]
              .getImagenHotDeal(),
          width: size.width * .95,
          height: size.height * .5,
        ),
      ),
    ]));
  }

  Widget _cardTerminos(
      BuildContext context, DirectorioModel listaHotDealsModel) {
    final size = MediaQuery.of(context).size;
    return Container(
        child: Stack(children: <Widget>[
      Row(children: <Widget>[]),
      Center(
        child: Image.network(
          listaHotDealsModel.beneficio?.hotdeal?.imagenes?[2]
              .getImagenHotDeal(),
          width: size.width * .95,
          height: size.height * .5,
        ),
      ),
    ]));
  }

  Widget _paginaWeb(BuildContext context, DirectorioModel listaHotDealsModel) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        SizedBox(width: 10.0),
        GestureDetector(
          onTap: () => _launchWeb(listaHotDealsModel),
          child: Text(listaHotDealsModel.comercio!.paginaWeb!,
              style: TextStyle(
                color: Theme.of(context).dividerColor,
                fontSize: 16.0,
              )),
        )
      ]),
    );
  }

  _launchWeb(DirectorioModel listaHotDealsModel) async {
    var s = listaHotDealsModel.comercio!.paginaWeb!.replaceAll("/", "");
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
