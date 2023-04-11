import 'package:aplicacion/Cliente.dart';
import 'package:aplicacion/PaginaDeRevisionViaje.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class HojaDeCompraCliente extends StatefulWidget {
  final Cliente cliente;

  const HojaDeCompraCliente(this.cliente, {Key? key}) : super(key: key);

  @override
  _HojaDeCompraClienteState createState() => _HojaDeCompraClienteState(cliente);
}

class _HojaDeCompraClienteState extends State<HojaDeCompraCliente> {
  Cliente? cliente;

  _HojaDeCompraClienteState(Cliente this.cliente);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(cliente!.nombre, style: textoAppBar),
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
                    "Material",
                    style: textoMediano,
                  ),
                  Text(
                    "Cantidad",
                    style: textoMediano,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cliente!.items.length,
                itemBuilder: (BuildContext context, int index) {
                  return elementosCliente(index, context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Center(
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      if (seCompletoTodosLosChecks()) {
                        conductor.agregarLista(cliente!);
                        clientes.remove(cliente);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    PaginaDeRevisionViaje(cliente!)),
                            ModalRoute.withName('/'));
                      } else {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            content: Text("Necesita Cargar Mas Cosas!",
                                style: textoMediano),
                            actions: [
                              TextButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black87),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Aceptar",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white)),
                              )
                            ],
                          ),
                        );
                      }
                    },
                    child: Text("Aceptar Viaje",
                        style: textoAppBar.copyWith(
                            fontWeight: FontWeight.normal))),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget elementosCliente(int index, context) {
    return ListTile(
      tileColor: colores[index % 2 == 0 ? 1 : 0],
      enabled: true,
      title: Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 10, right: 0, left: 0),
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
      trailing: cliente!.items[index].obtenido
          ? const Icon(Icons.check_box)
          : const Icon(Icons.check_box_outline_blank_outlined),
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text(
              cliente!.items[index].nombre,
              style: textoMediano,
            ),
            content: Text(
                "Se require ${cliente!.items[index].cantidad} de este producto",
                style: textoNormal),
            actions: [
              boton("Adquirido", context, true, index),
              boton("No adquirido", context, false, index)
            ],
          ),
        );
      },
    );
  }

  TextButton boton(String texto, BuildContext context, bool valor, int index) {
    return TextButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
      onPressed: () {
        Navigator.pop(context);
        setState(() {
          cliente!.items[index].obtenido = valor;
        });
      },
      child: Text(texto,
          style: const TextStyle(fontSize: 15, color: Colors.white)),
    );
  }

  bool seCompletoTodosLosChecks() {
    return !cliente!.items.any((element) => element.obtenido == false);
  }
}
