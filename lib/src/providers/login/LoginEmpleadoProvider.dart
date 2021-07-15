import 'dart:async';
import 'dart:convert';

import 'package:capital24_2/src/models/loginModelEmpleado.dart';
import 'package:http/http.dart' as http;
import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';

class LoginsProvider {
  String _urlDato = "capital24-5phdg.ondigitalocean.app";
  String _pathDato = "/login/";
  dynamic headers = {"Content-type": "application/json; charset=utf-8"};
  final _prefs = new PreferenciasUsuario();

  Future<Map<String, dynamic>> loginUsuario(
      String username, String password) async {
    //nuevousuario

    final authData = {
      'username': username,
      'password': password,
      'returnToken': true
    };
    final url = Uri.https(_urlDato, _pathDato);

    final resp =
        await http.post(url, headers: headers, body: json.encode(authData));

    Map<String, dynamic> decodeResp = json.decode(resp.body);

    if (decodeResp.containsKey('token')) {
      _prefs.token = decodeResp['token'];
      _prefs.userId = decodeResp['userId'];
      _prefs.tipoUsuario = decodeResp['tipoUsuario'];
      return {
        'ok': true,
        'token': decodeResp['token'],
        'userId': decodeResp['userId'],
        'tipoUsuario': decodeResp['tipoUsuario']
      };
    } else {
      return {'ok': false, 'mensaje': 'error'};
    }
  }

  Future<LoginModel> getDato(String username, String password) async {
    final authData = {
      'username': username,
      'password': password,
      'returnToken': true
    };
    final urlDatos = Uri.https(_urlDato, _pathDato);

    http.Response respDatos = await http.post(urlDatos,
        headers: headers, body: json.encode(authData));

    final dataLogin = json.decode(utf8.decode(respDatos.bodyBytes));
    final datosLoginModel = new LoginModel.fromJsonMap(dataLogin);

    return datosLoginModel;
  }
}

final datosLoginProvider = LoginsProvider();
