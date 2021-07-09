import 'dart:convert';
import 'dart:async';

import 'package:capital24_2/src/models/InformacionPersonalModel.dart';
import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:http/http.dart' as http;

class DatoPersonalEmpleadoProvider {
  final _prefs = PreferenciasUsuario();

  //String _url = "206.189.71.55:8000";
  //String  _path = "/empleado/${loginModel.userId}d/datos-personales/";
  //String _path = "/empleado/38533/datos-personales/";

  Future<DatoPersonalEmpleadoModel> getDatoPersonal() async {
    String _url = "capital24-5phdg.ondigitalocean.app";
    String _path = "/empleado/${_prefs.userId}/datos-personales/";
    final url = Uri.https(_url, _path);

    final headersToken = {'Authorization': 'Token ${_prefs.token}'};

    http.Response resp = await http.get(
      url,
      headers: headersToken,
    );
    final dataDatoPersonalEmpleado = json.decode(utf8.decode(resp.bodyBytes));
    final datosPersonalEmpleadoModel =
        new DatoPersonalEmpleadoModel.fromJsonMap(dataDatoPersonalEmpleado);

    return datosPersonalEmpleadoModel;
  }
}

final datoPersonalEmpleadoProvider = DatoPersonalEmpleadoProvider();
