class LoginsClienteModel {
  List<LoginClienteModel> items = [];

  LoginsClienteModel();

  LoginsClienteModel.fromJsonList(List<dynamic> jsonList) {
    for (var item in jsonList) {
      final login = new LoginClienteModel.map(item);
      items.add(login);
    }
  }
}

class LoginClienteModel {
  late String _token;
  late int _userId;
  late String _tipoUsuario;
  int? _centro;
  int? _area;

  LoginClienteModel(this._token, this._userId, this._tipoUsuario);

  LoginClienteModel.map(dynamic obj) {
    this._token = obj["token"];
    this._userId = obj["userId"];
    this._tipoUsuario = obj["tipoUsuario"];
    this._centro = obj["centro"];
    this._area = obj["area"];
  }

  String get token => _token;
  String get userId => _userId.toString();
  String get tipoUsuario => _tipoUsuario;
  String get centro => _centro.toString();
  String get area => _area.toString();

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    _token = map["token"];
    _userId = map["userId"];
    _tipoUsuario = map["tipoUsuario"];
    _centro = map["centro"];
    _area = map["area"];

    return map;
  }

  LoginClienteModel.fromJsonMap(Map<String, dynamic> json) {
    _token = json["token"];
    _userId = json["userId"];
    _tipoUsuario = json["tipoUsuario"];
    _area = json["area"];
    _centro = json["centro"];
  }
}
