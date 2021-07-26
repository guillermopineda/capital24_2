// import 'package:capital24_2/src/bloc/mapa/mapa_bloc.dart';
// import 'package:capital24_2/src/bloc/mi_ubicacion/mi_ubicacion_bloc.dart';
// import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
// import 'package:capital24_2/src/widgets/appBtnMiRuta.dart';
// import 'package:capital24_2/src/widgets/appBtnSeguirUbicacion.dart';
// import 'package:capital24_2/src/widgets/appBtnUbicacion.dart';
// import 'package:capital24_2/src/widgets/appNoCliente.dart';
// import 'package:capital24_2/src/widgets/appNoLogin.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class Mapa extends StatefulWidget {
//   static const String routeName = '/mapa';

//   @override
//   _MapaState createState() => _MapaState();
// }

// class _MapaState extends State<Mapa> with AutomaticKeepAliveClientMixin {
//   @override
//   void initState() {
//     BlocProvider.of<MiUbicacionBloc>(context);
//     super.initState();
//   }

//   @override
//   bool get wantKeepAlive => true;

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     final _prefs = PreferenciasUsuario();
//     if (_prefs.tipoUsuario == '') {
//       return NoLogin();
//     } else {
//       if (_prefs.tipoUsuario == 'cliente') {
//         return NoCliente();
//       } else {
//         return Scaffold(
//           body: BlocBuilder<MiUbicacionBloc, MiUbicacionState>(
//               builder: (_, state) => crearMapa(state)),
//           floatingActionButton: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               BtnUbicacion(),
//               BtnSeguirUbicacion(),
//               BtnMiRuta(),
//               // GestureDetector(
//               //   onTap: () {
//               //     calcularDestino(context);
//               //   },
//               //   child: Icon(FontAwesomeIcons.accusoft),
//               // )
//             ],
//           ),
//         );
//       }
//     }
//   }

//   Widget crearMapa(MiUbicacionState state) {
//     if (!state.existeUbicacion) return Center(child: Text('Ubicando...'));

//     final mapaBloc = context.read<MapaBloc>();

//     mapaBloc.add(OnNuevaUbicacion(state.ubicacion!));

//     final cameraPosition =
//         new CameraPosition(target: state.ubicacion!, zoom: 13);
//     return BlocBuilder<MapaBloc, MapaState>(
//       builder: (context, state) {
//         return GoogleMap(
//           initialCameraPosition: cameraPosition,
//           compassEnabled: false,
//           myLocationEnabled: true,
//           myLocationButtonEnabled: false,
//           zoomControlsEnabled: false,
//           onMapCreated: mapaBloc.initMapa,
//           polylines: mapaBloc.state.polylines.values.toSet(),
//           markers: mapaBloc.state.markers.values.toSet(),
//           onCameraMove: (cameraPosition) {
//             mapaBloc.add(OnMovioMapa(cameraPosition.target));
//           },
//         );
//       },
//     );
//   }

//   // void calcularDestino(BuildContext context) async {
//   //   final trafficService = new TrafficService();
//   //   final mapaBloc = context.read<MapaBloc>();
//   //   final inicio = context.read<MiUbicacionBloc>().state.ubicacion;
//   //   final destino = mapaBloc.state.ubicacionCentral;
//   //   final trafficResponse =
//   //       await trafficService.getCoordsInicioYDestino(inicio, destino);
//   //   final geometry = trafficResponse.routes[0].geometry;
//   //   final duracion = trafficResponse.routes[0].duration;
//   //   final distancia = trafficResponse.routes[0].distance;
//   //   final points = Poly.Polyline.Decode(encodedString: geometry, precision: 6)
//   //       .decodedCoords;
//   //   final List<LatLng> rutaCoordenadas =
//   //       points.map((point) => LatLng(point[0], point[1])).toList();
//   //   mapaBloc
//   //       .add(OnCrearRutaInicioDestino(rutaCoordenadas, distancia, duracion));
//   //   print("---------------SHALA--------------------");
//   //   print(rutaCoordenadas);
//   // }
// }
