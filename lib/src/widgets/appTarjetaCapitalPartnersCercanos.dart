import 'package:capital24_2/src/models/capitalBenefits/localizacionCapitalBenefitsModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppTarjetasTduCercanos extends StatelessWidget {
  final List<TduLocalizacion>? tduCercano;

  const AppTarjetasTduCercanos({this.tduCercano});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: this.tduCercano?.length,
        itemBuilder: (BuildContext context, int index) {
          return _TarjetaDescuento(
              descuentoCercano: this.tduCercano![index], index: index);
        });
  }
}

class _TarjetaDescuento extends StatelessWidget {
  final TduLocalizacion? descuentoCercano;
  final int? index;

  const _TarjetaDescuento({this.descuentoCercano, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(children: <Widget>[
        new GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/capitalPartnersCercanosDetalle',
                arguments: this.descuentoCercano);
          },
          child: ClipRRect(
            child: Container(
                child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      _LogosTdu(
                        descuentoCercano: descuentoCercano!,
                      ),
                      _Separador(),
                      _DescripcionTdu(descuentoCercano: descuentoCercano!),
                      _Flecha(),
                    ],
                  ),
                )
              ],
            )),
          ),
        )
      ]),
    );
  }
}

class _LogosTdu extends StatelessWidget {
  final TduLocalizacion? descuentoCercano;
  final int? index;

  const _LogosTdu({this.descuentoCercano, this.index});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    descuentoCercano!.comercio?.unicoId =
        '${descuentoCercano!.comercio!.getImagenCercano()}-cercanos-${descuentoCercano!.sucursal?.distancia}';

    return Hero(
      tag: descuentoCercano!.comercio!.unicoId as Object,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: FadeInImage.assetNetwork(
              image: descuentoCercano!.comercio?.getImagenCercano(),
              placeholder: "images/load_2.gif",
              height: _screenSize.height * .17,
              width: _screenSize.width * .30,
            ),
          ),
        ),
      ),
    );
  }
}

class _Separador extends StatelessWidget {
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Row(children: <Widget>[
      SizedBox(width: 15.0),
      Container(
        color: Theme.of(context).dividerColor,
        height: _screenSize.height * .1,
        width: 2.0,
      ),
      SizedBox(width: 15.0),
    ]);
  }
}

class _DescripcionTdu extends StatelessWidget {
  final TduLocalizacion? descuentoCercano;
  final int? index;

  const _DescripcionTdu({this.descuentoCercano, this.index});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    var f = NumberFormat('#,###');
    return Flexible(
        child: Container(
      width: _screenSize.width * .45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            descuentoCercano?.comercio!.nombre as String,
            style: TextStyle(
                color: Theme.of(context).dividerColor, fontSize: 20.0),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          Text(
            descuentoCercano?.beneficio!.promocorta as String,
            style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Text("Estas a " +
              f.format(descuentoCercano!.sucursal?.distancia).toString() +
              " m"),
        ],
      ),
    ));
  }
}

class _Flecha extends StatelessWidget {
  Widget build(BuildContext context) {
    return Icon(
      Icons.arrow_forward_ios,
      color: Theme.of(context).dividerColor,
    );
  }
}
