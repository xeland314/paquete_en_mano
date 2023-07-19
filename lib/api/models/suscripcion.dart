import 'dart:convert';

import 'package:paquete_en_mano/api/models/funcionalidad.dart';

class Suscripcion {
  final int id;
  final String tipo;
  final DateTime fechaEmision;
  final DateTime fechaCaducidad;
  final String precio;
  final List<Funcionalidad> funcionalidades;

  Suscripcion({
    required this.id,
    required this.tipo,
    required this.fechaEmision,
    required this.fechaCaducidad,
    required this.precio,
    required this.funcionalidades,
  });

  factory Suscripcion.fromRawJson(String str) =>
      Suscripcion.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Suscripcion.fromJson(Map<String, dynamic> json) => Suscripcion(
        id: json["id"],
        tipo: json["tipo"],
        fechaEmision: DateTime.parse(json["fecha_emision"]),
        fechaCaducidad: DateTime.parse(json["fecha_caducidad"]),
        precio: json["precio"],
        funcionalidades: List<Funcionalidad>.from(
            json["funcionalidades"].map((x) => Funcionalidad.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "fecha_emision":
            "${fechaEmision.year.toString().padLeft(4, '0')}-${fechaEmision.month.toString().padLeft(2, '0')}-${fechaEmision.day.toString().padLeft(2, '0')}",
        "fecha_caducidad":
            "${fechaCaducidad.year.toString().padLeft(4, '0')}-${fechaCaducidad.month.toString().padLeft(2, '0')}-${fechaCaducidad.day.toString().padLeft(2, '0')}",
        "precio": precio,
        "funcionalidades":
            List<dynamic>.from(funcionalidades.map((x) => x.toJson())),
      };
}
