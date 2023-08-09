import 'dart:convert';

class Usuario {
  final int id;
  final int empresa;
  final String role;
  final String cedula;
  final String email;
  final String direccion;
  final String telefono;
  final DateTime fechaNacimiento;
  final String nivelEducacion;
  final String estadoCivil;
  final String? fotografia;
  final String nombres;
  final String apellidos;

  Usuario({
    required this.id,
    required this.empresa,
    required this.role,
    required this.cedula,
    required this.email,
    required this.direccion,
    required this.telefono,
    required this.fechaNacimiento,
    required this.nivelEducacion,
    required this.estadoCivil,
    this.fotografia,
    required this.nombres,
    required this.apellidos,
  });

  factory Usuario.fromRawJson(String str) => Usuario.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        empresa: json["empresa"],
        role: json["role"],
        cedula: json["cedula"],
        email: json["email"],
        direccion: json["direccion"],
        telefono: json["telefono"],
        fechaNacimiento: DateTime.parse(json["fecha_nacimiento"]),
        nivelEducacion: json["nivel_educacion"],
        estadoCivil: json["estado_civil"],
        fotografia: json["fotografia"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "empresa": empresa,
        "role": role,
        "cedula": cedula,
        "email": email,
        "direccion": direccion,
        "telefono": telefono,
        "fecha_nacimiento":
            "${fechaNacimiento.year.toString().padLeft(4, '0')}-${fechaNacimiento.month.toString().padLeft(2, '0')}-${fechaNacimiento.day.toString().padLeft(2, '0')}",
        "nivel_educacion": nivelEducacion,
        "estado_civil": estadoCivil,
        "fotografia": fotografia,
        "nombres": nombres,
        "apellidos": apellidos,
      };
}
