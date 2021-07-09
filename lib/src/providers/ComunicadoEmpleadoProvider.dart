import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

import 'package:capital24_2/src/models/comunicadoEmpleadoModel.dart';

class ComunicadoProvider {
  final _prefs = PreferenciasUsuario();
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  String _url = "capital24-5phdg.ondigitalocean.app";
  String _path = "/empleado/muro/";
  List<ComunicadoModel> comunicados = [];

  Future<List<ComunicadoModel>> getComunicado() async {
    // ignore: unused_local_variable
    bool kisweb;
    var topicEmpleadoGlobal =
        _firebaseMessaging.subscribeToTopic("e" '${_prefs.tipoUsuario}');
    print(topicEmpleadoGlobal);
    try {
      if (Platform.isIOS) {
        await _firebaseMessaging.subscribeToTopic('capital24');
        kisweb = false;
      } else if (Platform.isAndroid) {
        await _firebaseMessaging.subscribeToTopic('capital24');
        kisweb = false;
      } else {
        kisweb = true;
      }
    } catch (e) {
      kisweb = true;
    }

    final url = Uri.https(
      _url,
      _path,
    );

    final headersToken = {'Authorization': 'Token ${_prefs.token}'};

    http.Response resp = await http.get(
      url,
      headers: headersToken,
    );
    final dataComunicado = json.decode(utf8.decode(resp.bodyBytes));
    final comunicadosModel = new ComunicadosModel.fromJsonList(dataComunicado);

    return comunicadosModel.items;
  }
}

final comunicadoProvider = ComunicadoProvider();
