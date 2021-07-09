class CumpleaniosModel {
  List<CumpleanioModel> items = [];

  CumpleaniosModel();

  CumpleaniosModel.fromJsonList(List<dynamic> jsonList) {
    for (var item in jsonList) {
      final cumpleanioModel = new CumpleanioModel.fromJsonMap(item);
      items.add(cumpleanioModel);
    }
  }
}

class CumpleanioModel {
  String? nombre;
  String? fechaNacimiento;

  CumpleanioModel({this.nombre, this.fechaNacimiento});

  CumpleanioModel.fromJsonMap(Map<String, dynamic> json) {
    nombre = json["nombre"];
    fechaNacimiento = json["fecha_nacimiento"];
  }
}
