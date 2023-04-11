import 'package:aplicacion/AplicacionCuerpo.dart';
import 'package:aplicacion/ControlVehiculo.dart';
import 'package:aplicacion/ListaDeViajesAceptados.dart';
import 'package:aplicacion/main.dart';
import 'package:flutter/material.dart';

class PaginaCuenta extends StatefulWidget {
  const PaginaCuenta({super.key});

  @override
  State<PaginaCuenta> createState() => _PaginaCuentaState();
}

class _PaginaCuentaState extends State<PaginaCuenta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Cuenta",
          style: textoAppBar,
        ),
      ),
      body: ListView.builder(
        itemCount: elementos.length,
        itemBuilder: (BuildContext context, int index) {
          return opcionesCuenta(index);
        },
      ),
    );
  }

  Widget opcionesCuenta(int index) {
    return ListTile(
        enabled: true,
        title: Padding(
          padding:
              const EdgeInsets.only(bottom: 10, top: 10, right: 0, left: 0),
          child: Row(
            children: [
              Icon(iconos[index], color: Colors.black,),
              SizedBox(width: 10,),
              Text(elementos.keys.elementAt(index), style: textoNormal),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => elementos.values.elementAt(index)));
        });
  }

  List<IconData> iconos = [
    Icons.person_3,
    Icons.lightbulb_circle,
    Icons.cabin_sharp
  ];

  Map<String, StatefulWidget> elementos = {
    "Configuracion Cuenta": ControlLuces(),
    "Revision De luces" : ControlLuces(),
    "Revision De Cabina": ControlCabina()
  };
}
