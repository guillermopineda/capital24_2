// import 'package:capital24_2/src/bloc/mapa/mapa_bloc.dart';
// import 'package:capital24_2/src/bloc/mi_ubicacion/mi_ubicacion_bloc.dart';
// import 'package:flutter/material.dart';

// class Provider extends InheritedWidget {
//   final inMapaBloc = MapaBloc();
//   final inMiUbicacionBloc = MiUbicacionBloc();

//   Provider({Key? key, required Widget child}) : super(key: key, child: child);

//   @override
//   bool updateShouldNotify(InheritedWidget oldWidget) => true;
//   static MapaBloc of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<Provider>()!.inMapaBloc;
//   }

//   static MiUbicacionBloc fo(BuildContext context) {
//     return context
//         .dependOnInheritedWidgetOfExactType<Provider>()!
//         .inMiUbicacionBloc;
//   }
// }
