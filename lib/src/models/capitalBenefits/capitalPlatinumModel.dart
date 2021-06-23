// import 'package:flutter/material.dart';

// class ListaHotDealsModel {
//   List<DirectorioModel> items = [];
//   ListaHotDealsModel();
//   ListaHotDealsModel.fromJsonList(List<dynamic> jsonList) {
//     for (var item in jsonList) {
//       final lista = new DirectorioModel.fromJson(item);
//       items.add(lista);
//     }
//   }
// }

// class DirectorioModel {
//   ComercioModel? comercio;
//   BeneficioModel? beneficio;
//   DirectorioModel({comercio, beneficio});
//   factory DirectorioModel.fromJson(Map<String, dynamic> json) {
//     return DirectorioModel(
//         comercio: ComercioModel.fromJson(json['comercio']),
//         beneficio: BeneficioModel.fromJson(json['beneficio']));
//   }
// }

// class BeneficioModel {
//   int? id;
//   TipoBeneficioModel? tipoBeneficio;
//   TipoRedencionModel? tipoRedencion;
//   String? promoCorta;
//   String? promoLarga;
//   String? descripcion;
//   String? terminos;
//   String? fechaFin;
//   bool? sinSucursal;
//   String? linkbeneficio;
//   HotdealModel? hotdeal;
//   BeneficioModel(
//       {id,
//       tipoBeneficio,
//       tipoRedencion,
//       promoCorta,
//       promoLarga,
//       descripcion,
//       terminos,
//       fechaFin,
//       sinSucursal,
//       linkbeneficio,
//       hotdeal});
//   factory BeneficioModel.fromJson(Map<String, dynamic> json) {
//     return BeneficioModel(
//         id: json['id'],
//         tipoBeneficio: TipoBeneficioModel.fromJson(json['tipobeneficio']),
//         tipoRedencion: TipoRedencionModel.fromJson(json['tiporedencion']),
//         promoCorta: json['promocorta'],
//         promoLarga: json['promolarga'],
//         descripcion: json['descripcion'],
//         terminos: json['terminos'],
//         fechaFin: json['fechafin'],
//         sinSucursal: json['sinsucursal'],
//         linkbeneficio: json['linkbeneficio'],
//         hotdeal: HotdealModel.fromJson(json['hotdeal']));
//   }
// }

// class HotdealModel {
//   int? idPublicacion;
//   List<ImagenModel>? imagenes;
//   HotdealModel({idPublicacion, imagenes});
//   factory HotdealModel.fromJson(Map<String, dynamic> json) {
//     var list = json['imagenes'] as List;
//     List<ImagenModel> imagenesList =
//         list.map((i) => ImagenModel.fromJson(i)).toList();
//     return HotdealModel(
//         idPublicacion: json['idpublicacion'], imagenes: imagenesList);
//   }
// }

// class ImagenModel {
//   String url = "http://tdushots.blob.core.windows.net";
//   int? id;
//   TipoImagenModel? tipoImagen;
//   String? path;
//   ImagenModel({id, tipoImagen, this.path});
//   factory ImagenModel.fromJson(Map<String, dynamic> json) {
//     return ImagenModel(
//         id: json['id'],
//         tipoImagen: TipoImagenModel.fromJson(json['tipoImagen']),
//         path: json['path']);
//   }

//   getImagenHotDeal() {
//     if (path!.isEmpty) {
//       return Image.asset('images/portada_c24.png');
//     } else {
//       return url + path!;
//     }
//   }
// }

// class TipoImagenModel {
//   int? id;
//   String? nombre;
//   TipoImagenModel({id, nombre});
//   factory TipoImagenModel.fromJson(Map<String, dynamic> json) {
//     return new TipoImagenModel(
//       id: json['id'],
//       nombre: json['nombre'],
//     );
//   }
// }

// class TipoBeneficioModel {
//   int? id;
//   String? nombre;
//   TipoBeneficioModel({id, nombre});
//   factory TipoBeneficioModel.fromJson(Map<String, dynamic> json) {
//     return new TipoBeneficioModel(
//       id: json['id'],
//       nombre: json['nombre'],
//     );
//   }
// }

// class TipoRedencionModel {
//   int? id;
//   String? nombre;
//   String? linkRedencion;
//   TipoRedencionModel({id, nombre, linkRedencion});
//   factory TipoRedencionModel.fromJson(Map<String, dynamic> json) {
//     return new TipoRedencionModel(
//       id: json['id'],
//       nombre: json['nombre'],
//       linkRedencion: json['linkredencion'],
//     );
//   }
// }

// class ComercioModel {
//   String url = "http://tdushots.blob.core.windows.net";
//   int? id;
//   String? nombre;
//   String? paginaWeb;
//   String? facebook;
//   String? logoPath;
//   GiroModel? giro;
//   SubgiroModel? subgiro;
//   ComercioModel(
//       {url, id, nombre, paginaWeb, facebook, logoPath, giro, subgiro});
//   factory ComercioModel.fromJson(Map<String, dynamic> json) {
//     return new ComercioModel(
//       id: json['id'],
//       nombre: json['nombre'],
//       paginaWeb: json['paginaweb'],
//       facebook: json['facebook'],
//       logoPath: json['logopath'],
//       giro: GiroModel.fromJson(json['giro']),
//       subgiro: SubgiroModel.fromJson(json['subgiro']),
//     );
//   }
//   getImagenBeneficio() {
//     print(logoPath);
//     if (logoPath!.isEmpty) {
//       return Image.asset('images/portada_c24.png');
//     } else {
//       return url + logoPath!;
//     }
//   }
// }

// class GiroModel {
//   int? id;
//   String? nombre;
//   int? orden;
//   GiroModel({id, nombre, orden});
//   factory GiroModel.fromJson(Map<String, dynamic> json) {
//     return new GiroModel(
//       id: json['id'],
//       nombre: json['nombre'],
//       orden: json['orden'],
//     );
//   }
// }

// class SubgiroModel {
//   int? id;
//   String? nombre;
//   SubgiroModel({id, nombre});
//   factory SubgiroModel.fromJson(Map<String, dynamic> json) {
//     return new SubgiroModel(
//       id: json['id'],
//       nombre: json['nombre'],
//     );
//   }
// }

import 'package:flutter/material.dart';

class ListaHotDealsModel {
  List<DirectorioModel> items = [];
  ListaHotDealsModel();

  ListaHotDealsModel.fromJsonList(List<dynamic> jsonList) {
    for (var item in jsonList) {
      final lista = new DirectorioModel.fromJson(item);
      items.add(lista);
    }
  }
}

class DirectorioModel {
  ComercioModel? comercio;
  BeneficioModel? beneficio;
  DirectorioModel({this.comercio, this.beneficio});
  factory DirectorioModel.fromJson(Map<String, dynamic> json) {
    return new DirectorioModel(
        comercio: ComercioModel.fromJson(json['comercio']),
        beneficio: BeneficioModel.fromJson(json['beneficio']));
  }
}

class BeneficioModel {
  int? id;
  TipoBeneficioModel? tipoBeneficio;
  TipoRedencionModel? tipoRedencion;
  String? promoCorta;
  String? promoLarga;
  String? descripcion;
  String? terminos;
  String? fechaFin;
  bool? sinSucursal;
  String? linkbeneficio;
  HotdealModel? hotdeal;
  BeneficioModel(
      {this.id,
      this.tipoBeneficio,
      this.tipoRedencion,
      this.promoCorta,
      this.promoLarga,
      this.descripcion,
      this.terminos,
      this.fechaFin,
      this.sinSucursal,
      this.linkbeneficio,
      this.hotdeal});

  factory BeneficioModel.fromJson(Map<String, dynamic> json) {
    return new BeneficioModel(
        id: json['id'],
        tipoBeneficio: TipoBeneficioModel.fromJson(json['tipobeneficio']),
        tipoRedencion: TipoRedencionModel.fromJson(json['tiporedencion']),
        promoCorta: json['promocorta'],
        promoLarga: json['promolarga'],
        descripcion: json['descripcion'],
        terminos: json['terminos'],
        fechaFin: json['fechafin'],
        sinSucursal: json['sinsucursal'],
        linkbeneficio: json['linkbeneficio'],
        hotdeal: HotdealModel.fromJson(json['hotdeal']));
  }
}

class HotdealModel {
  int? idPublicacion;
  List<ImagenModel>? imagenes;
  HotdealModel({this.idPublicacion, this.imagenes});
  factory HotdealModel.fromJson(Map<String, dynamic> json) {
    var list = json['imagenes'] as List;
    List<ImagenModel> imagenesList =
        list.map((i) => ImagenModel.fromJson(i)).toList();
    return new HotdealModel(
        idPublicacion: json['idpublicacion'], imagenes: imagenesList);
  }
}

class ImagenModel {
  int? id;
  TipoImagenModel? tipoImagen;
  String? path;
  ImagenModel({this.id, this.path, this.tipoImagen});
  factory ImagenModel.fromJson(Map<String, dynamic> json) {
    return new ImagenModel(
        id: json['id'],
        tipoImagen: TipoImagenModel.fromJson(json['tipoImagen']),
        path: json['path']);
  }
  getImagenHotDeal() {
    if (path == null) {
      return Image.asset('images/portada_c24.png');
    } else {
      return 'http://tdushots.blob.core.windows.net$path';
    }
  }
}

class TipoImagenModel {
  int? id;
  String? nombre;
  TipoImagenModel({this.id, this.nombre});
  factory TipoImagenModel.fromJson(Map<String, dynamic> json) {
    return new TipoImagenModel(
      id: json['id'],
      nombre: json['nombre'],
    );
  }
}

class TipoBeneficioModel {
  int? id;
  String? nombre;
  TipoBeneficioModel({this.id, this.nombre});
  factory TipoBeneficioModel.fromJson(Map<String, dynamic> json) {
    return new TipoBeneficioModel(
      id: json['id'],
      nombre: json['nombre'],
    );
  }
}

class TipoRedencionModel {
  int? id;
  String? nombre;
  String? linkRedencion;
  TipoRedencionModel({
    this.id,
    this.nombre,
    this.linkRedencion,
  });
  factory TipoRedencionModel.fromJson(Map<String, dynamic> json) {
    return new TipoRedencionModel(
      id: json['id'],
      nombre: json['nombre'],
      linkRedencion: json['linkredencion'],
    );
  }
}

// COMERCIO

class ComercioModel {
  String url = "http://tdushots.blob.core.windows.net";
  int? id;
  String? nombre;
  String? paginaWeb;
  String? facebook;
  String? logoPath;
  GiroModel? giro;
  SubgiroModel? subgiro;
  ComercioModel(
      {this.id,
      this.nombre,
      this.paginaWeb,
      this.facebook,
      this.logoPath,
      this.giro,
      this.subgiro});
  factory ComercioModel.fromJson(Map<String, dynamic> json) {
    return new ComercioModel(
      id: json['id'],
      nombre: json['nombre'],
      paginaWeb: json['paginaweb'],
      facebook: json['facebook'],
      logoPath: json['logopath'],
      giro: GiroModel.fromJson(json['giro']),
      subgiro: SubgiroModel.fromJson(json['subgiro']),
    );
  }
  getImagenBeneficio() {
    if (logoPath == null) {
      return Image.asset('images/portada_c24.png');
    } else {
      return 'http://tdushots.blob.core.windows.net$logoPath';
    }
  }
}

class GiroModel {
  int? id;
  String? nombre;
  int? orden;
  GiroModel({this.id, this.nombre, this.orden});
  factory GiroModel.fromJson(Map<String, dynamic> json) {
    return new GiroModel(
      id: json['id'],
      nombre: json['nombre'],
      orden: json['orden'],
    );
  }
}

class SubgiroModel {
  int? id;
  String? nombre;
  SubgiroModel({this.id, this.nombre});
  factory SubgiroModel.fromJson(Map<String, dynamic> json) {
    return new SubgiroModel(
      id: json['id'],
      nombre: json['nombre'],
    );
  }
}
