import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:capital24_2/src/widgets/appNoCliente.dart';
import 'package:capital24_2/src/widgets/appNoLogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class SucursalesMapa extends StatefulWidget {
  static const String routeName = '/sucursalesMapa';
  @override
  _SucursalesMapaState createState() => _SucursalesMapaState();
}

class _SucursalesMapaState extends State<SucursalesMapa> {
  final mapController = new MapController();
  String tipoMapa = 'streets';
  @override
  Widget build(BuildContext context) {
    final _prefs = PreferenciasUsuario();
    if (_prefs.tipoUsuario == '') {
      return NoLogin();
    } else {
      if (_prefs.tipoUsuario == 'cliente') {
        return NoCliente();
      } else {
        return Scaffold(
          appBar: AppBar(
            title: Text('Mapa - Cercános'),
            centerTitle: true,
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back)),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.my_location),
                onPressed: () {
                  mapController.move((LatLng(19.6976575, -99.2229489)), 16);
                },
              )
            ],
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          body: SafeArea(
              bottom: true,
              maintainBottomViewPadding: true,
              child: _crearFlutterMap()),
          floatingActionButton: _botonFlotanteRuta(),
        );
      }
    }
  }

  Widget _botonFlotanteRuta() {
    return FloatingActionButton(
      child: Icon(
        FontAwesomeIcons.directions,
      ),
      onPressed: () => _launchRuta(),
    );
  }

  Widget _crearFlutterMap() {
    return FlutterMap(
      mapController: mapController,
      options: new MapOptions(
          minZoom: 15.0, center: LatLng(19.6976575, -99.2229489), zoom: 16),
      layers: [
        _crearMapa(),
        _crearMarcadores(),
      ],
    );
  }

  _crearMapa() {
    return TileLayerOptions(
        backgroundColor: Theme.of(context).canvasColor,
        maxZoom: 18,
        minZoom: 13,
        urlTemplate:
            "https://api.mapbox.com/styles/v1/admingn10/ck8t4se9q01yb1io6f0tqyn50/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYWRtaW5nbjEwIiwiYSI6ImNrOHJvOWJjeDBncXUzZXJzd3Zsbm9zcTgifQ.kWzq_7iLv2DgtylFCxtPaw",
        additionalOptions: {
          'accessToken':
              'pk.eyJ1IjoiYWRtaW5nbjEwIiwiYSI6ImNrOHJvOWJjeDBncXUzZXJzd3Zsbm9zcTgifQ.kWzq_7iLv2DgtylFCxtPaw',
          'id': 'mapbox.mapbox-streets-v8'
        });
  }

  _crearMarcadores() {
    return MarkerLayerOptions(markers: <Marker>[
      Marker(
          width: 100.0,
          height: 100.0,
          point: LatLng(19.6976575, -99.2229489),
          builder: (context) => IconButton(
                icon: Icon(FontAwesomeIcons.mapMarkerAlt,
                    size: 40.0, color: Theme.of(context).dividerColor),
                autofocus: true,
                onPressed: () => _informacionLocal(),
              ))
    ]);
  }

  void _informacionLocal() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          final _screenSize = MediaQuery.of(context).size;
          return AlertDialog(
            backgroundColor: Theme.of(context).backgroundColor,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      height: _screenSize.height * .2,
                      width: _screenSize.width * .5,
                      color: Colors.white,
                      child: Image(
                        image: NetworkImage(
                          "https://gn10.sfo3.digitaloceanspaces.com/gn10/intranet/bienestar/2021/06/21/WhatsApp_Image_2021-06-21_at_10.04.32.jpeg",
                        ),
                        height: _screenSize.height * 1,
                      ),
                    ),
                  ),
                  Divider(
                    color: Theme.of(context).dividerColor,
                  ),
                  GestureDetector(
                    onTap: () => _launchPaginaWeb(),
                    child: Text("Esto es una página web",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16.0,
                        )),
                  ),
                  Divider(
                    color: Theme.of(context).dividerColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                              height: _screenSize.height * .1,
                              width: _screenSize.width * .2,
                              child: Text("Titulo de sucursal",
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.bold))),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Container(
                                height: _screenSize.height * .10,
                                width: _screenSize.width * .3,
                                child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  child: Text(
                                    "Beneficio de sucursal",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.directions,
                      color: Theme.of(context).dividerColor,
                    ),
                    onPressed: () => _launchRuta(),
                  )
                ]),
          );
        });
  }

  _launchPaginaWeb() async {
    final paginaweb = 'https://intragn10.com/comunicados';
    if (await canLaunch(paginaweb)) {
      await launch(paginaweb);
    } else {
      throw 'No es posible enviar al sitio $paginaweb';
    }
  }

  _launchRuta() async {
    final rutaweb = 'https://goo.gl/maps/gsDRDaYZAbbe4A8y8';
    if (await canLaunch(rutaweb)) {
      await launch(rutaweb);
    } else {
      throw 'No es posible enviar a la ruta de en.';
    }
  }
}
