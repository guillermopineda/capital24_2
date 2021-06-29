import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:capital24_2/src/themes/mapTheme.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'mapa_event.dart';
part 'mapa_state.dart';

class MapaBloc extends Bloc<MapaEvent, MapaState> {
  MapaBloc() : super(new MapaState());

  // Controlador del Mapa
  GoogleMapController? _mapController;
  //Polylines
  Polyline _miRuta = new Polyline(
      polylineId: PolylineId('mi_ruta'), color: Colors.transparent, width: 4);

  Polyline _miRutaDestino = new Polyline(
      polylineId: PolylineId('mi_rutaDestino'),
      color: Color(0xff003C71),
      width: 4);

  void initMapa(GoogleMapController controller) async {
    this._mapController = controller;
    this._mapController!.setMapStyle(jsonEncode(mapTheme));
    add(OnMapaListo());
  }

  void moverCamara(LatLng destino) async {
    final cameraUpdate = CameraUpdate.newLatLng(destino);
    await this._mapController!.animateCamera(cameraUpdate);
  }

  @override
  Stream<MapaState> mapEventToState(
    MapaEvent event,
  ) async* {
    if (event is OnMapaListo) {
      print('-------------Mapa Listo-------------');
      yield state.copyWith(mapaListo: true);
    } else if (event is OnNuevaUbicacion) {
      yield* this._onNuevaUbicacion(event);
    } else if (event is OnMarcarRecorrido) {
      yield* this._onMarcarRecorrido(event);
    } else if (event is OnSeguirUbicacion) {
      yield* this._onSeguirUbicacion(event);
    } else if (event is OnMovioMapa) {
      yield* this._onMovioMapa(event);
    } else if (event is OnCrearRutaInicioDestino) {
      yield* this._onCrearRutaInicioDestino(event);
    }
  }

  Stream<MapaState> _onNuevaUbicacion(OnNuevaUbicacion event) async* {
    if (state.seguirUbicacion) {
      this.moverCamara(event.ubicacion);
    }
    List<LatLng> points = [...this._miRuta.points, event.ubicacion];
    this._miRuta = this._miRuta.copyWith(pointsParam: points);
    final currentPolylines = state.polylines;
    currentPolylines['mi_ruta'] = this._miRuta;
    yield state.copyWith(polylines: currentPolylines);
  }

  Stream<MapaState> _onMarcarRecorrido(OnMarcarRecorrido event) async* {
    if (!state.dibujarRecorrido) {
      this._miRuta = this._miRuta.copyWith(colorParam: Color(0xff0077C8));
    } else {
      this._miRuta = this._miRuta.copyWith(colorParam: Colors.transparent);
    }
    final currentPolylines = state.polylines;
    currentPolylines['mi_ruta'] = this._miRuta;
    yield state.copyWith(
        dibujarRecorrido: !state.dibujarRecorrido, polylines: currentPolylines);
  }

  Stream<MapaState> _onSeguirUbicacion(OnSeguirUbicacion event) async* {
    if (!state.seguirUbicacion) {
      this.moverCamara(this._miRuta.points[this._miRuta.points.length - 1]);
    }
    yield state.copyWith(seguirUbicacion: !state.seguirUbicacion);
  }

  Stream<MapaState> _onMovioMapa(OnMovioMapa event) async* {
    yield state.copyWith(ubicacionCentral: event.centroMapa);
  }

  Stream<MapaState> _onCrearRutaInicioDestino(
      OnCrearRutaInicioDestino event) async* {
    this._miRutaDestino =
        this._miRutaDestino.copyWith(pointsParam: event.rutaCoordenadas);
    final currentPolylines = state.polylines;
    currentPolylines['mi_ruta_destino'] = this._miRutaDestino;

    yield state.copyWith(polylines: currentPolylines);
  }
}
