import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final Function(int) onItemSelected;

  const Menu({Key? key, required this.onItemSelected}) : super(key: key);

  DrawerHeader buildHeader() {
    return const DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.indigo,
      ),
      child: Text(
        'Paquete en mano',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildHeader(),
          ListTile(
            leading: const Icon(Icons.waterfall_chart),
            title: const Text('Bitácora diaria'),
            onTap: () {
              Navigator.of(context).pop();
              onItemSelected(0);
            },
          ),
          ListTile(
            leading: const Icon(Icons.article_outlined),
            title: const Text('Reporte diario'),
            onTap: () {
              Navigator.of(context).pop();
              onItemSelected(1);
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Historial de bitácoras'),
            onTap: () {
              Navigator.of(context).pop();
              onItemSelected(2);
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_on_outlined),
            title: const Text('Historial de ubicaciones'),
            onTap: () {
              Navigator.of(context).pop();
              onItemSelected(3);
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notificaciones'),
            onTap: () {
              Navigator.of(context).pop();
              onItemSelected(4);
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Perfil'),
            onTap: () {
              Navigator.of(context).pop();
              onItemSelected(5);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Ajustes'),
            onTap: () {
              Navigator.of(context).pop();
              onItemSelected(6);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Salir'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              onItemSelected(7);
            },
          ),
        ],
      ),
    );
  }
}
