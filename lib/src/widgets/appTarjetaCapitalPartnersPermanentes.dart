import 'package:capital24_2/src/models/capitalBenefits/serviciosCapitalBenefitsModel.dart';
import 'package:flutter/material.dart';

class AppTarjetasTduPermanentes extends StatelessWidget {
  final List<TduServicios>? tdu;

  const AppTarjetasTduPermanentes({this.tdu});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: this.tdu?.length,
        itemBuilder: (BuildContext context, int index) {
          return _TarjetaDescuento(descuento: this.tdu?[index], index: index);
        });
  }
}

class _TarjetaDescuento extends StatelessWidget {
  final TduServicios? descuento;
  final int? index;

  const _TarjetaDescuento({this.descuento, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(children: <Widget>[
        new GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/capitalPartnersDirectorioDetalle',
                arguments: this.descuento);
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
                        descuento: descuento!,
                      ),
                      _Separador(),
                      _DescripcionTdu(descuento: descuento!),
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
  final TduServicios? descuento;
  final int? index;

  const _LogosTdu({this.descuento, this.index});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    descuento!.comercio?.unicoId =
        '${descuento!.comercio!.getImagenDirectorio()}-tarjetaDirectorio-${descuento!.comercio?.id}';

    return Hero(
      tag: descuento!.comercio!.unicoId as Object,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: FadeInImage.assetNetwork(
              image: descuento!.comercio?.getImagenDirectorio(),
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
  final TduServicios? descuento;
  final int? index;

  const _DescripcionTdu({this.descuento, this.index});

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
            descuento?.comercio!.nombre as String,
            style: TextStyle(
                color: Theme.of(context).dividerColor, fontSize: 20.0),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          Text(
            descuento?.beneficio!.promocorta as String,
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
