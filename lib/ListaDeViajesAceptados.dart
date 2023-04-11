import 'package:aplicacion/PaginaDeRevisionViaje.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class ListaDeViajesAceptados extends StatefulWidget {
  const ListaDeViajesAceptados({super.key});

  @override
  State<ListaDeViajesAceptados> createState() => _ListaDeViajesAceptadosState();
}

class _ListaDeViajesAceptadosState extends State<ListaDeViajesAceptados> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Actividad", style: textoAppBar),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                tileColor: colores[0],
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Viajes Aceptados",
                      style: textoMediano,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: conductor.viajes!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return cliente(conductor.viajes![index].nombre,
                        conductor.viajes![index].direccion, index);
                  },
                ),
              ),
            ],
          ),
        ));
  }

  Widget cliente(String nombre, String direccion, int index) {
    return ListTile(
        tileColor: colores[index % 2 == 0 ? 1 : 0],
        enabled: true,
        title: Padding(
          padding:
              const EdgeInsets.only(bottom: 10, top: 10, right: 0, left: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(nombre, style: textoNormal),
              Text(direccion, style: textoNormal),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      PaginaDeRevisionViaje(conductor.viajes![index])));
        });
  }
}
