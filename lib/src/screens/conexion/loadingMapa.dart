// import 'package:capital24_2/src/helpers/helpers.dart';
// import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
// import 'package:capital24_2/src/screens/conexion/accesoGPS.dart';
// import 'package:capital24_2/src/screens/registro.dart';
// import 'package:capital24_2/src/widgets/appNoCliente.dart';
// import 'package:capital24_2/src/widgets/appNoLogin.dart';
// //import 'package:capital24_2/src/screens/conexion/mapa.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:permission_handler/permission_handler.dart';

// class LoadingMapa extends StatefulWidget {
//   static const String routeName = '/loadingMapa';

//   @override
//   _LoadingMapaState createState() => _LoadingMapaState();
// }

// class _LoadingMapaState extends State<LoadingMapa> with WidgetsBindingObserver {
//   @override
//   void initState() {
//     WidgetsBinding.instance?.addObserver(this);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance?.removeObserver(this);
//     super.dispose();
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) async {
//     if (state == AppLifecycleState.resumed) {
//       if (await Geolocator.isLocationServiceEnabled()) {
//         Navigator.pushReplacement(
//             context, navegarMapaFadeIn(context, Sucursales()));
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final _screenSize = MediaQuery.of(context).size;
//     final _prefs = PreferenciasUsuario();
//     if (_prefs.tipoUsuario == '') {
//       return NoLogin();
//     } else {
//       if (_prefs.tipoUsuario == 'cliente') {
//         return NoCliente();
//       } else {
//         return Scaffold(
//           body: FutureBuilder(
//             future: this.checkGpsYLocation(context),
//             builder: (BuildContext context, AsyncSnapshot snapshot) {
//               if (snapshot.hasData) {
//                 return Center(
//                   child: Text(snapshot.data),
//                 );
//               } else {
//                 return Center(
//                     child: Container(
//                         height: _screenSize.height * .85,
//                         child: Image.asset(
//                           "images/load_2.gif",
//                         )));
//               }
//             },
//           ),
//         );
//       }
//     }
//   }

//   Future checkGpsYLocation(BuildContext context) async {
//     //PermisoGPS
//     final permisoGPS = await Permission.location.isGranted;

//     //GPS está activo

//     final gpsActivo = await Geolocator.isLocationServiceEnabled();

//     if (permisoGPS && gpsActivo) {
//       Navigator.pushReplacement(
//           context, navegarMapaFadeIn(context, Sucursales()));
//       return;
//     } else if (!permisoGPS) {
//       Navigator.pushReplacement(
//           context, navegarMapaFadeIn(context, AccesoGPS()));
//       return 'Es necesario permiso GPS';
//     } else {
//       return 'Active GPS';
//     }
//   }
// }
