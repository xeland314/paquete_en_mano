import 'package:flutter/material.dart';
import 'HojaDeCompraCliente.dart';
import 'main.dart';

class ListaDeViajesDisponibles extends StatefulWidget {
  const ListaDeViajesDisponibles({super.key});

  @override
  State<ListaDeViajesDisponibles> createState() =>
      _ListaDeViajesDisponiblesState();
}

class _ListaDeViajesDisponiblesState extends State<ListaDeViajesDisponibles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Viajes",
          style: textoAppBar,
        ),
        backgroundColor: Colors.black,
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
                    "Clientes",
                    style: textoMediano,
                  ),
                  Text(
                    "Ubicacion",
                    style: textoMediano,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: clientes.length,
                itemBuilder: (BuildContext context, int index) {
                  return cliente(
                      clientes[index].nombre, clientes[index].direccion, index);
                },
              ),
            )
          ],
        ),
      ),
    );
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
                  builder: (context) => HojaDeCompraCliente(clientes[index])));
        });
  }
}
