import 'package:flutter/material.dart';
import 'package:paquete_en_mano/api/models/usuario.dart';

class PerfilUsuario extends StatelessWidget {
  final Usuario usuario;

  const PerfilUsuario({Key? key, required this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil de ${usuario.nombres} ${usuario.apellidos}'),
      ),
      body: ListView(
        children: [
          if (usuario.fotografia != null)
            ListTile(
              title: const Text('Fotografía'),
              subtitle: Image.network(usuario.fotografia!),
            ),
          ListTile(
            title: const Text('ID'),
            subtitle: Text(usuario.id.toString()),
          ),
          ListTile(
            title: const Text('Empresa'),
            subtitle: Text(usuario.empresa.toString()),
          ),
          ListTile(
            title: const Text('Rol'),
            subtitle: Text(usuario.role),
          ),
          ListTile(
            title: const Text('Cédula'),
            subtitle: Text(usuario.cedula),
          ),
          ListTile(
            title: const Text('Email'),
            subtitle: Text(usuario.email),
          ),
          ListTile(
            title: const Text('Dirección'),
            subtitle: Text(usuario.direccion),
          ),
          ListTile(
            title: const Text('Teléfono'),
            subtitle: Text(usuario.telefono),
          ),
          ListTile(
            title: const Text('Fecha de nacimiento'),
            subtitle: Text(
                '${usuario.fechaNacimiento.day}/${usuario.fechaNacimiento.month}/${usuario.fechaNacimiento.year}'),
          ),
          ListTile(
            title: const Text('Nivel de educación'),
            subtitle: Text(usuario.nivelEducacion),
          ),
          ListTile(
            title: const Text('Estado civil'),
            subtitle: Text(usuario.estadoCivil),
          ),
        ],
      ),
    );
  }
}
