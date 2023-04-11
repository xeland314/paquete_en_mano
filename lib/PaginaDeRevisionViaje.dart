import 'package:aplicacion/main.dart';
import 'package:flutter/material.dart';
import 'Cliente.dart';

class PaginaDeRevisionViaje extends StatefulWidget {
  Cliente? cliente;
  PaginaDeRevisionViaje(Cliente this.cliente, {super.key});

  @override
  State<PaginaDeRevisionViaje> createState() =>
      _PaginaDeRevisionViajeState(cliente!);
}

class _PaginaDeRevisionViajeState extends State<PaginaDeRevisionViaje> {
  Cliente? cliente;
  _PaginaDeRevisionViajeState(Cliente this.cliente);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Viaje Adquirido", style: textoAppBar),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Detalles Del Viaje:", style: textoGrande),
            const SizedBox(height: 15),
            textoFIlas(
                "Se debe realizar la entrega para el siguiente cliente: ",
                cliente!.nombre),
            const SizedBox(
              height: 5,
            ),
            textoFIlas("En la siguiente direccion: ", cliente!.direccion),
            const SizedBox(
              height: 5,
            ),
            Text("Se debe entregar los siguientes items: ", style: textoNormal),
            const SizedBox(
              height: 15,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: cliente!.items.length,
              itemBuilder: (BuildContext context, int index) {
                return elementosCliente(index, context);
              },
            )),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Center(
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {},
                  child: Text("Entrega Completada",
                      style:
                          textoAppBar.copyWith(fontWeight: FontWeight.normal)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }

  Row textoFIlas(String primerTexto, String segundoTexto) {
    return Row(
      children: [
        Text(primerTexto, style: textoNormal),
        Text(segundoTexto,
            style: textoNormal.copyWith(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget elementosCliente(int index, context) {
    return ListTile(
      tileColor: colores[index % 2 == 0 ? 1 : 0],
      enabled: true,
      title: Padding(
        padding: const EdgeInsets.only(bottom: 5, top: 5, right: 0, left: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              cliente!.items[index].nombre,
              style: textoNormal,
            ),
            Text(
              cliente!.items[index].cantidad.toString(),
              style: textoNormal,
            ),
          ],
        ),
      ),
    );
  }
}
