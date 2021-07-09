import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences? _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  deletePrefs() async {
    this._prefs!.clear();
  }

  existPrefs(String key) async {
    if (this._prefs!.containsKey(key)) {
      return true;
    } else {
      return false;
    }
  }

  // GET y SET del token
  String get token {
    return _prefs!.getString(
          'token',
        ) ??
        "Sin token";
  }

  set token(String value) {
    _prefs!.setString('token', value);
  }

  // GET y SET de la user Id
  int get userId {
    return _prefs!.getInt('userId')!.toInt();
  }

  set userId(int value) {
    _prefs!.setInt('userId', value);
  }

  // GET y SET de la tipoUsuario
  String get tipoUsuario {
    return _prefs!.getString('tipoUsuario') ?? '';
  }

  set tipoUsuario(String value) {
    _prefs!.setString('tipoUsuario', value);
  }
}
