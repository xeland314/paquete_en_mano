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

  static bool esCedulaValida(String cedula) {
    // Verificar que el número tenga exactamente 10 dígitos
    if (cedula.length != 10) {
      return false;
    }

    // Extraer el tercer dígito y verificar que sea menor o igual a 6
    int tercerDigito = int.parse(cedula.substring(2, 3));
    if (tercerDigito > 6) {
      return false;
    }

    // Calcular la suma de los productos de los dígitos en las posiciones impares por 2
    int sumaImpares = 0;
    for (int i = 0; i < cedula.length - 1; i += 2) {
      int digito = int.parse(cedula[i]) * 2;
      if (digito >= 10) {
        digito -= 9;
      }
      sumaImpares += digito;
    }

    // Calcular la suma de los dígitos en las posiciones pares
    int sumaPares = 0;
    for (int i = 1; i < cedula.length - 1; i += 2) {
      sumaPares += int.parse(cedula[i]);
    }

    // Sumar los resultados de los pasos anteriores
    int sumaTotal = sumaImpares + sumaPares;

    // Calcular el residuo de la división entre la suma total y 10
    int residuo = sumaTotal % 10;

    // Restar el residuo a 10 y verificar si el resultado es igual al décimo dígito
    int verificador = residuo == 0 ? residuo : (10 - residuo);
    return verificador == int.parse(cedula[9]);
  }
}
