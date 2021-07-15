import 'package:capital24_2/src/models/capitalBenefits/descuentosCapitalModel.dart';
import 'package:flutter/material.dart';

class AppTarjetasTduPermanentes extends StatelessWidget {
  final List<DescuentoCapitalModel>? descuento;

  const AppTarjetasTduPermanentes({this.descuento});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: this.descuento?.length,
        itemBuilder: (BuildContext context, int index) {
          return _TarjetaDescuento(
              descuentoCapital: this.descuento?[index], index: index);
        });
  }
}

class _TarjetaDescuento extends StatelessWidget {
  final DescuentoCapitalModel? descuentoCapital;
  final int? index;

  const _TarjetaDescuento({this.descuentoCapital, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(children: <Widget>[
        new GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/capitalPartnersDirectorioDetalle',
                arguments: this.descuentoCapital);
          },
          child: ClipRRect(
            child: Container(
                child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    children: <Widget>[
                      _LogosTdu(
                        descuentoCapital: descuentoCapital!,
                      ),
                      _Separador(),
                      _DescripcionTdu(descuentoCapital: descuentoCapital!),
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
  final DescuentoCapitalModel? descuentoCapital;
  final int? index;

  const _LogosTdu({this.descuentoCapital, this.index});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    descuentoCapital!.unicoId =
        '${descuentoCapital!.logo}-tarjetaDirectorio-${descuentoCapital!.id}';

    return Hero(
      tag: descuentoCapital!.unicoId as Object,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: FadeInImage?.assetNetwork(
              image: descuentoCapital!.getImagenLogo(),
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
  final DescuentoCapitalModel? descuentoCapital;
  final int? index;

  const _DescripcionTdu({this.descuentoCapital, this.index});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Flexible(
        child: Container(
      width: _screenSize.width * .45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            descuentoCapital?.nombreEstablecimiento as String,
            style: TextStyle(
                color: Theme.of(context).dividerColor, fontSize: 20.0),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          Text(
            descuentoCapital?.marcaEstablecimeinto as String,
            style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
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
