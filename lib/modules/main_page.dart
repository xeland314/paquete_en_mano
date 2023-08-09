import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:paquete_en_mano/api/empresa_api.dart';
import 'package:paquete_en_mano/api/models/usuario.dart';
import 'package:paquete_en_mano/api/usuarios_api.dart';
import 'package:paquete_en_mano/modules/menu.dart';
import 'package:paquete_en_mano/modules/perfil_usuario/perfil.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  final _storage = const FlutterSecureStorage();
  UsuarioApi? usuarioApi;
  dynamic usuario;
  EmpresaApi? empresaApi;
  dynamic empresa;

  @override
  void initState() {
    super.initState();
    initUsuario();
  }

  Future<void> initUsuario() async {
    final token = await _storage.read(key: "token");
    final username = await _storage.read(key: "username");
    usuarioApi = UsuarioApi(token!);
    empresaApi = EmpresaApi(token);
    Usuario usuario = await usuarioApi!.searchUsuario(username!);
    empresa = await empresaApi!.getEmpresa(usuario.empresa);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard', textAlign: TextAlign.right),
        backgroundColor: Colors.indigo,
      ),
      drawer: Menu(
        onItemSelected: (index) {
          // Aquí es donde se cambia la navegación
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PerfilUsuario(usuario: usuario, empresa: empresa),
                ),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PerfilUsuario(usuario: usuario, empresa: empresa),
                ),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PerfilUsuario(usuario: usuario, empresa: empresa),
                ),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PerfilUsuario(usuario: usuario, empresa: empresa),
                ),
              );
              break;
            case 4:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PerfilUsuario(usuario: usuario, empresa: empresa),
                ),
              );
              break;
            case 5:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PerfilUsuario(usuario: usuario, empresa: empresa),
                ),
              );
              break;
            case 6:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PerfilUsuario(usuario: usuario, empresa: empresa),
                ),
              );
              break;
            default:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PerfilUsuario(usuario: usuario, empresa: empresa),
                ),
              );
          }
        },
      ),
    );
  }
}
