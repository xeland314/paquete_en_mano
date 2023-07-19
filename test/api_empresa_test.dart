import 'package:paquete_en_mano/api/empresa_api.dart';

Future<void> main() async {
  EmpresaApi empresasApi =
      EmpresaApi("30f0e41d8195c518f1587e099a09d33fa4063f1c");
  final empresas = await empresasApi.getEmpresas();
  print(empresas);
}
