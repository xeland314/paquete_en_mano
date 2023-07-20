import 'package:flutter/material.dart';
import 'package:paquete_en_mano/modules/menu.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  Widget buildBody() {
    switch (_selectedIndex) {
      case 0:
        return const Text('Bitácora diaria');
      case 1:
        return const Text('Reporte diario');
      case 2:
        return const Text('Historial de bitácoras');
      case 3:
        return const Text('Historial de ubicaciones');
      case 4:
        return const Text('Notificaciones');
      case 5:
        return const Text('Perfil');
      case 6:
        return const Text('Ajustes');
      default:
        return const Text('Salir');
    }
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
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: buildBody(),
    );
  }
}
