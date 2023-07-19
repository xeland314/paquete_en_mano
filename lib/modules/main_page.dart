import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  DrawerHeader buildHeader() {
    return const DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.blue,
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
          const ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notificaciones'),
          ),
          const ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Perfil'),
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Ajustes'),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Salir'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard', textAlign: TextAlign.right),
        backgroundColor: Colors.indigo,
      ),
      drawer: const Menu(),
      body: const Center(),
    );
  }
}
