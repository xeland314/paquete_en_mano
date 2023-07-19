import 'package:paquete_en_mano/api/api.dart';
import 'package:paquete_en_mano/api/models/funcionalidad.dart';

class FuncionalidadApi extends Api {
  FuncionalidadApi(String token) : super(token);

  Future<List<Funcionalidad>> getFuncionalidades() async {
    final data = await get('funcionalidad');
    if (data is List) {
      final funcionalidades =
          data.map((e) => Funcionalidad.fromJson(e)).toList();
      return funcionalidades;
    } else {
      throw Exception('Error al recuperar las funcionalidades: $data');
    }
  }

  Future<Funcionalidad> getFuncionalidad(int id) async {
    final data = await get('funcionalidad/$id');
    if (data is Map<String, dynamic>) {
      final funcionalidad = Funcionalidad.fromJson(data);
      return funcionalidad;
    } else {
      throw Exception('Error al recuperar la funcionalidad: $data');
    }
  }
}
