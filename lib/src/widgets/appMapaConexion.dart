// import 'package:capital24_2/src/bloc/mapa/mapa_bloc.dart';
// import 'package:capital24_2/src/bloc/mi_ubicacion/mi_ubicacion_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class BtnUbicacion extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final mapaBloc = BlocProvider.of<MapaBloc>(context);
//     final miUbicacionBloc = BlocProvider.of<MiUbicacionBloc>(context);
//     return Container(
//       margin: EdgeInsets.only(bottom: 30),
//       child: CircleAvatar(
//         backgroundColor: Colors.white,
//         maxRadius: 25,
//         child: IconButton(
//           icon: Icon(Icons.my_location),
//           onPressed: () {
//             final destino = miUbicacionBloc.state.ubicacion;
//             mapaBloc.moverCamara(destino!);
//           },
//         ),
//       ),
//     );
//   }
// }
