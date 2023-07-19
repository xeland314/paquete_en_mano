import 'dart:convert';

class Funcionalidad {
  final int id;
  final String nombre;
  final String descripcion;

  Funcionalidad({
    required this.id,
    required this.nombre,
    required this.descripcion,
  });

  factory Funcionalidad.fromRawJson(String str) =>
      Funcionalidad.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Funcionalidad.fromJson(Map<String, dynamic> json) => Funcionalidad(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
      };
}
