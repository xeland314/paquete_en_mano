import 'package:paquete_en_mano/api/models/suscripcion.dart';

import 'api.dart';

class SuscripcionApi extends Api {
  SuscripcionApi(String token) : super(token);

  Future<List<Suscripcion>> getSuscripciones() async {
    final data = await get('suscripciones');
    if (data is List) {
      final suscripciones = data.map((e) => Suscripcion.fromJson(e)).toList();
      return suscripciones;
    } else {
      throw Exception('Error al recuperar las suscripciones: $data');
    }
  }

  Future<Suscripcion> getSuscripcion(int id) async {
    final data = await get('suscripciones/$id');
    if (data is Map<String, dynamic>) {
      final suscripcion = Suscripcion.fromJson(data);
      return suscripcion;
    } else {
      throw Exception('Error al recuperar la suscripción: $data');
    }
  }
}
