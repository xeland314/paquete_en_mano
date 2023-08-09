import 'package:paquete_en_mano/api/api.dart';
import 'package:paquete_en_mano/api/models/usuario.dart';

class UsuarioApi extends Api {
  UsuarioApi(String token) : super(token);
  final String _route = 'api/v1/perfiles';

  Future getUsuario(int id) async {
    final data = await get('$_route/$id');
    if (data is Map<String, dynamic>) {
      return data;
    } else {
      throw Exception('Error al recuperar usuario: $data');
    }
  }

  Future<Usuario> searchUsuario(String id) async {
    String searchRoute = "search/";
    if (Usuario.esCedulaValida(id)) {
      searchRoute += "?cedula=$id";
    } else {
      searchRoute += "?email=$id";
    }
    final data = await get('$_route/$searchRoute');
    if (data is Map<String, dynamic>) {
      return Usuario.fromJson(data);
    } else {
      throw Exception('Error al recuperar usuario: $data');
    }
  }

  Future createUsuario(Map<String, dynamic> data) async {
    final response = await post(_route, data);
    if (response is Map<String, dynamic>) {
      return response;
    } else {
      throw Exception('Error al crear usuario: $response');
    }
  }

  Future updateUsuario(int id, Map<String, dynamic> data) async {
    final response = await update('$_route/$id', data);
    if (response is Map<String, dynamic>) {
      return response;
    } else {
      throw Exception('Error al actualizar usuario: $response');
    }
  }

  Future deleteUsuario(int id) async {
    final response = await delete('$_route/$id');
    if (response != null) {
      throw Exception('Error al eliminar usuario: $response');
    }
  }
}
