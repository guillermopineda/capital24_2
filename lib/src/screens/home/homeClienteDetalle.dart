import 'package:flutter/material.dart';

//import 'package:url_launcher/url_launcher.dart';

class HomeClienteDetalle extends StatelessWidget {
  static const String routeName = '/homeClienteDetalle';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: CustomScrollView(
          slivers: <Widget>[
            //_crearAppBar(context,comunicadoModel),
            _crearAppBar(context),
            SliverList(
                delegate: SliverChildListDelegate([
              SizedBox(height: 10.0),
              //_nombreComunicado(context,comunicadoModel),
              //_descripcionComunicado(context,comunicadoModel),
              _nombreComunicado(context),
              _descripcionComunicado(context),
            ]))
          ],
        ));
  }

  Widget _crearAppBar(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      stretchTriggerOffset: 150,
      // onStretchTrigger: () {
      //   return;
      // },
      elevation: 2.0,
      backgroundColor: Colors.grey.shade400,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: [StretchMode.zoomBackground],
        centerTitle: true,
        title: Text(
          "comunicadoModel.nombre",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Theme.of(context).backgroundColor,
            fontSize: 16.0,
          ),
        ),
        background: FadeInImage.assetNetwork(
          placeholder: "images/load_2.gif",
          //image: comunicadoModel.getImagenDetalle(),
          image: "images/logo.png",
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _nombreComunicado(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Hero(
            tag: "comunicadoModel.comunicadoId",
            child: Container(
              height: _screenSize.height * .2,
              width: _screenSize.width * .45,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image(
                  //image: NetworkImage(comunicadoModel.getImagenComunicado()),
                  image: NetworkImage('images/logo.png'),
                  fit: BoxFit.fill,
                  height: 150.0,
                ),
              ),
            ),
          ),
          SizedBox(width: 20.0),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "comunicadoModel.nombre",
                style: Theme.of(context).textTheme.headline6,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
              GestureDetector(
                child: Container(
                    child: Text(
                  "Ir al enlace",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Theme.of(context).dividerColor),
                )),
                //onTap: () => _launchEnlace(context, comunicadoModel),
                onTap: () => _launchEnlace(context),
              ),
            ],
          ))
        ],
      ),
    );
  }

  Widget _descripcionComunicado(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Column(
        children: [
          Text("comunicadoModel.descripcion",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 16.0,
                  color: Theme.of(context).textTheme.bodyText1!.color)),
        ],
      ),
    );
  }

  Future<void> _launchEnlace(BuildContext context) async {
    // final webasismed = '${comunicadoModel.urlReferencia}';
    // if (await canLaunch(webasismed)) {
    //   await launch(webasismed);
    // } else {
    //   throw 'No es posible enviar al sitio $webasismed';
    // }
  }
}
