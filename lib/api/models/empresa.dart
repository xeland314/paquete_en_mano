import 'dart:convert';

class Empresa {
  final int id;
  final String nombreComercial;
  final String ruc;
  final int suscripcion;
  final String direccion;
  final String correo;
  final String telefono;
  final dynamic logoEmpresa;

  Empresa({
    required this.id,
    required this.nombreComercial,
    required this.ruc,
    required this.suscripcion,
    required this.direccion,
    required this.correo,
    required this.telefono,
    this.logoEmpresa,
  });

  factory Empresa.fromRawJson(String str) => Empresa.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Empresa.fromJson(Map<String, dynamic> json) => Empresa(
        id: json["id"],
        nombreComercial: json["nombre_comercial"],
        ruc: json["ruc"],
        suscripcion: json["suscripcion"],
        direccion: json["direccion"],
        correo: json["correo"],
        telefono: json["telefono"],
        logoEmpresa: json["logo_empresa"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre_comercial": nombreComercial,
        "ruc": ruc,
        "suscripcion": suscripcion,
        "direccion": direccion,
        "correo": correo,
        "telefono": telefono,
        "logo_empresa": logoEmpresa,
      };

  @override
  String toString() {
    return 'Empresa(id: $id, nombreComercial: $nombreComercial, ruc: $ruc, suscripcion: $suscripcion, direccion: $direccion, correo: $correo, telefono: $telefono, logoEmpresa: $logoEmpresa)';
  }
}
