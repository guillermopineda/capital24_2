// import 'package:capital24_2/src/bloc/mi_ubicacion/mi_ubicacion_bloc.dart';
// import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
// import 'package:capital24_2/src/widgets/appHamburguesaEmpleadoEspejo.dart';
// import 'package:capital24_2/src/widgets/appNoCliente.dart';
// import 'package:capital24_2/src/widgets/appNoLogin.dart';
// import 'package:capital24_2/src/widgets/appSucursales.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class Sucursales extends StatefulWidget {
//   static const String routeName = '/sucursales';

//   @override
//   _SucursalesState createState() => _SucursalesState();
// }

// class _SucursalesState extends State<Sucursales> {
//   @override
//   void initState() {
//     BlocProvider.of<MiUbicacionBloc>(context).iniciarSeguimiento();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     BlocProvider.of<MiUbicacionBloc>(context).cancelarSeguimiento();
//     super.dispose();
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
//           backgroundColor: Theme.of(context).backgroundColor,
//           appBar: AppBar(
//             title: Text("Sucursales"),
//             centerTitle: true,
//             actions: <Widget>[
//               IconButton(
//                 icon: Icon(Icons.search),
//                 onPressed: () => null,
//                 // onPressed: () {
//                 //   showSearch(
//                 //     context: context,
//                 //     delegate: ColaboradoresSearch(
//                 //         plantillaColaboradoresModel: snapshot.data),
//                 //   );
//                 // }
//               )
//             ],
//           ),
//           endDrawer: HamburguesaEmpleadoEspejo(),
//           body: SafeArea(
//             bottom: true,
//             maintainBottomViewPadding: true,
//             child: SingleChildScrollView(
//               physics: BouncingScrollPhysics(),
//               child: Container(
//                 child: Column(
//                   children: <Widget>[
//                     Container(
//                       height: _screenSize.height * .85,
//                       child: ListView(
//                         padding: EdgeInsets.symmetric(horizontal: 15.0),
//                         children: <Widget>[
//                           Container(child: AppTarjetaSucursales()),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       }
//     }
//   }
// }
