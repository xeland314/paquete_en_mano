import 'package:paquete_en_mano/api/api.dart';
import 'package:paquete_en_mano/api/models/empresa.dart';

class EmpresaApi extends Api {
  EmpresaApi(String token) : super(token);

  Future<List<Empresa>> getEmpresas() async {
    final data = await get('empresas');
    if (data is List) {
      final empresas = data.map((e) => Empresa.fromJson(e)).toList();
      return empresas;
    } else {
      throw Exception('Error al recuperar empresas: $data');
    }
  }

  Future<Empresa> getEmpresa(int id) async {
    final data = await get('empresas/$id');
    if (data is Map<String, dynamic>) {
      final empresa = Empresa.fromJson(data);
      return empresa;
    } else {
      throw Exception('Error al recuperar empresa: $data');
    }
  }
}
