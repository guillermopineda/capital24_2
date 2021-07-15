import 'dart:async';
import 'dart:convert';

import 'package:capital24_2/src/models/loginModelCliente.dart';
import 'package:http/http.dart' as http;
import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';

class LoginsClienteProvider {
  String _urlDato = "capital24-5phdg.ondigitalocean.app";
  String _pathDato = "/login/";
  dynamic headers = {"Content-type": "application/json; charset=utf-8"};
  final _prefs = new PreferenciasUsuario();

  Future<Map<String, dynamic>> loginCliente(
      String usernameCliente, String passwordCliente) async {
    //nuevousuario

    final authData = {
      'username': usernameCliente,
      'password': passwordCliente,
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

  Future<LoginClienteModel> getDato(
      String usernameCliente, String passwordCliente) async {
    final authData = {
      'username': usernameCliente,
      'password': passwordCliente,
      'returnToken': true
    };
    final urlDatos = Uri.https(_urlDato, _pathDato);

    http.Response respDatos = await http.post(urlDatos,
        headers: headers, body: json.encode(authData));

    final dataLoginCliente = json.decode(utf8.decode(respDatos.bodyBytes));
    final datosLoginClienteModel =
        new LoginClienteModel.fromJsonMap(dataLoginCliente);
    print(datosLoginClienteModel);

    return datosLoginClienteModel;
  }
}

final datosLoginClienteProvider = LoginsClienteProvider();
