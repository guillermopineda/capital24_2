// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// part 'mi_ubicacion_event.dart';
// part 'mi_ubicacion_state.dart';

// class MiUbicacionBloc extends Bloc<MiUbicacionEvent, MiUbicacionState> {
//   MiUbicacionBloc() : super(MiUbicacionState());

//   StreamSubscription<Position>? _positionSubscription;

//   void iniciarSeguimiento() {
//     this._positionSubscription = Geolocator.getPositionStream(
//             desiredAccuracy: LocationAccuracy.high,
//             distanceFilter: 100,
//             timeLimit: Duration(minutes: 15))
//         .listen((Position position) {
//       final nuevaUbicacion = new LatLng(position.latitude, position.longitude);
//       add(OnUbicacionCambio(nuevaUbicacion));
//     });
//   }

//   void cancelarSeguimiento() {
//     this._positionSubscription?.cancel();
//   }

//   @override
//   Stream<MiUbicacionState> mapEventToState(
//     MiUbicacionEvent event,
//   ) async* {
//     if (event is OnUbicacionCambio) {
//       print(event);
//       print('La nueva Ubicacion es ${event.ubicacion}');
//       yield state.copyWith(existeUbicacion: true, ubicacion: event.ubicacion);
//     }
//   }
// }
