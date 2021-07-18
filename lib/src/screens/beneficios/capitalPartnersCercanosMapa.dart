// import 'package:url_launcher/url_launcher.dart';
// import 'package:capital24_2/src/models/capitalBenefits/localizacionCapitalBenefitsModel.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:flutter_map/plugin_api.dart';

// class CapitalPartnersCercanosMapa extends StatefulWidget {
//   static const String routeName = '/capitalPartnersCercanosMapa';
//   @override
//   _CapitalPartnersCercanosMapaState createState() =>
//       _CapitalPartnersCercanosMapaState();
// }

// class _CapitalPartnersCercanosMapaState
//     extends State<CapitalPartnersCercanosMapa> {
//   final mapController = new MapController();
//   String tipoMapa = 'streets';

//   @override
//   Widget build(BuildContext context) {
//     final TduLocalizacion listaDirectorioModel =
//         ModalRoute.of(context)!.settings.arguments as TduLocalizacion;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Mapa - Cercános'),
//         centerTitle: true,
//         leading: GestureDetector(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Icon(Icons.arrow_back)),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.my_location),
//             onPressed: () {
//               mapController.move(
//                   (LatLng(listaDirectorioModel.sucursal!.latitud as double,
//                       listaDirectorioModel.sucursal!.longitud as double)),
//                   16);
//             },
//           )
//         ],
//       ),
//       backgroundColor: Theme.of(context).backgroundColor,
//       body: SafeArea(
//           bottom: true,
//           maintainBottomViewPadding: true,
//           child: _crearFlutterMap(listaDirectorioModel)),
//       floatingActionButton: _botonFlotanteRuta(context, listaDirectorioModel),
//     );
//   }

//   Widget _botonFlotanteRuta(context, TduLocalizacion listaDirectorioModel) {
//     return FloatingActionButton(
//       child: Icon(
//         FontAwesomeIcons.directions,
//       ),
//       onPressed: () => _launchRuta(listaDirectorioModel),
//     );
//   }

//   Widget _crearFlutterMap(TduLocalizacion listaDirectorioModel) {
//     return FlutterMap(
//       mapController: mapController,
//       options: new MapOptions(
//           minZoom: 15.0,
//           center: LatLng(listaDirectorioModel.sucursal!.latitud as double,
//               listaDirectorioModel.sucursal!.longitud as double),
//           zoom: 16),
//       layers: [
//         _crearMapa(),
//         _crearMarcadores(listaDirectorioModel),
//       ],
//     );
//   }

//   _crearMapa() {
//     return TileLayerOptions(
//         backgroundColor: Theme.of(context).canvasColor,
//         maxZoom: 18,
//         minZoom: 13,
//         urlTemplate:
//             "https://api.mapbox.com/styles/v1/admingn10/ck8t4se9q01yb1io6f0tqyn50/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYWRtaW5nbjEwIiwiYSI6ImNrOHJvOWJjeDBncXUzZXJzd3Zsbm9zcTgifQ.kWzq_7iLv2DgtylFCxtPaw",
//         additionalOptions: {
//           'accessToken':
//               'pk.eyJ1IjoiYWRtaW5nbjEwIiwiYSI6ImNrOHJvOWJjeDBncXUzZXJzd3Zsbm9zcTgifQ.kWzq_7iLv2DgtylFCxtPaw',
//           'id': 'mapbox.mapbox-streets-v8'
//         });
//   }

//   _crearMarcadores(TduLocalizacion listaDirectorioModel) {
//     return MarkerLayerOptions(markers: <Marker>[
//       Marker(
//           width: 100.0,
//           height: 100.0,
//           point: LatLng(listaDirectorioModel.sucursal!.latitud as double,
//               listaDirectorioModel.sucursal!.longitud as double),
//           builder: (context) => IconButton(
//                 icon: Icon(FontAwesomeIcons.mapMarkerAlt,
//                     size: 40.0, color: Theme.of(context).dividerColor),
//                 autofocus: true,
//                 onPressed: () => _informacionLocal(listaDirectorioModel),
//               ))
//     ]);
//   }

//   void _informacionLocal(TduLocalizacion listaDirectorioModel) {
//     showDialog(
//         context: context,
//         barrierDismissible: true,
//         builder: (BuildContext context) {
//           final _screenSize = MediaQuery.of(context).size;
//           return AlertDialog(
//             backgroundColor: Theme.of(context).backgroundColor,
//             elevation: 5.0,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20.0)),
//             content: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(20.0),
//                     child: Container(
//                       height: _screenSize.height * .2,
//                       width: _screenSize.width * .5,
//                       color: Colors.white,
//                       child: Image(
//                         image: NetworkImage(
//                           listaDirectorioModel.comercio!.getImagenMapa(),
//                         ),
//                         height: _screenSize.height * 1,
//                       ),
//                     ),
//                   ),
//                   Divider(
//                     color: Theme.of(context).dividerColor,
//                   ),
//                   GestureDetector(
//                     onTap: () => _launchPaginaWeb(listaDirectorioModel),
//                     child:
//                         Text(listaDirectorioModel.comercio!.paginaweb as String,
//                             style: TextStyle(
//                               color: Theme.of(context).primaryColor,
//                               fontSize: 16.0,
//                             )),
//                   ),
//                   Divider(
//                     color: Theme.of(context).dividerColor,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Column(
//                         children: <Widget>[
//                           Container(
//                               height: _screenSize.height * .1,
//                               width: _screenSize.width * .2,
//                               child: Text(
//                                   listaDirectorioModel.sucursal!.nombre
//                                       as String,
//                                   style: TextStyle(
//                                       color: Theme.of(context).accentColor,
//                                       fontWeight: FontWeight.bold))),
//                         ],
//                       ),
//                       Column(
//                         children: <Widget>[
//                           SingleChildScrollView(
//                             physics: BouncingScrollPhysics(),
//                             child: Container(
//                                 height: _screenSize.height * .10,
//                                 width: _screenSize.width * .3,
//                                 child: SingleChildScrollView(
//                                   physics: BouncingScrollPhysics(),
//                                   child: Text(
//                                     listaDirectorioModel.beneficio!.promolarga
//                                         as String,
//                                     style: TextStyle(
//                                       color: Theme.of(context)
//                                           .textTheme
//                                           .bodyText1!
//                                           .color,
//                                       fontSize: 14.0,
//                                     ),
//                                   ),
//                                 )),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   IconButton(
//                     icon: Icon(
//                       FontAwesomeIcons.directions,
//                       color: Theme.of(context).dividerColor,
//                     ),
//                     onPressed: () => _launchRuta(listaDirectorioModel),
//                   )
//                 ]),
//           );
//         });
//   }

//   _launchPaginaWeb(TduLocalizacion listaDirectorioModel) async {
//     var s = listaDirectorioModel.comercio!.paginaweb!.replaceAll("/", "");
//     var t = s.indexOf(":");
//     var w = s.substring(t + 1);

//     final paginaweb = 'http://$w';
//     if (await canLaunch(paginaweb)) {
//       await launch(paginaweb);
//     } else {
//       throw 'No es posible enviar al sitio $paginaweb';
//     }
//   }

//   _launchRuta(TduLocalizacion listaDirectorioModel) async {
//     final rutaweb =
//         'https://www.google.com.mx/maps/search/${listaDirectorioModel.sucursal!.latitud},${listaDirectorioModel.sucursal!.longitud}';
//     if (await canLaunch(rutaweb)) {
//       await launch(rutaweb);
//     } else {
//       throw 'No es posible enviar a la ruta de ${listaDirectorioModel.comercio!.nombre} en ${listaDirectorioModel.sucursal!.nombre}.';
//     }
//   }
// }
