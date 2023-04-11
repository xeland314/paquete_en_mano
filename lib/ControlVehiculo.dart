import 'package:flutter/material.dart';

import 'Conductor.dart';
import 'Vehiculo.dart';

class ControlVehiculo extends StatelessWidget {
  const ControlVehiculo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Control de Vehiculo"),
          backgroundColor: const Color(0xFF33333c),
        ),
        body: ModulosControl(conductores: getConductores()),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  List<Conductor> getConductores() {
    return [
      Conductor.vehiculo("Pepe", Vehiculo("12345")),
      Conductor.vehiculo("Jaime", Vehiculo("67890")),
      Conductor.vehiculo("Juan", Vehiculo("abcdef"))
    ];
  }
}

class ModulosControl extends StatefulWidget {
  final List<Conductor> conductores;

  const ModulosControl({super.key, required this.conductores});

  @override
  ModulosControlEstado createState() => ModulosControlEstado();
}

class ModulosControlEstado extends State<ModulosControl> {
  Conductor? conductor;

  @override
  Widget build(BuildContext context) {
    conductor = conductor ?? widget.conductores.first;
    double margin = MediaQuery.of(context).size.height * 0.05;
    return Center(
      child: Column(children: [
        Container(
          padding: EdgeInsets.only(top: margin * 3),
          child: DropdownButton(
              iconEnabledColor: const Color(0xFF515a84),
              autofocus: false,
              value: conductor,
              items: widget.conductores
                  .map<DropdownMenuItem<Conductor>>((Conductor conductor) {
                return DropdownMenuItem<Conductor>(
                    value: conductor, child: Text(conductor.toString()));
              }).toList(),
              onChanged: (Conductor? valor) {
                setState(() {
                  conductor = valor!;
                });
              }),
        ),
        Card(
          margin: EdgeInsets.only(top: margin),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.2,
            child: Center(
              child: TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF515a84)),
                child: const Text("Cabezal"),
                onPressed: () {
                  if (conductor != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ControlCabezal(
                                conductor: conductor as Conductor)));
                  }
                },
              ),
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.only(top: margin),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.2,
            child: Center(
              child: TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF515a84)),
                child: const Text("Cisterna"),
                onPressed: () {
                  if (conductor != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ControlCisterna(
                                conductor: conductor as Conductor)));
                  }
                },
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

abstract class Control extends StatefulWidget {
  late final String titulo;
  late final Map<String, bool> elementos;
  final Conductor conductor;

  Control({super.key, required this.conductor});

  @override
  ControlEstado createState() => ControlEstado();
}

class ControlEstado extends State<Control> {
  @override
  Widget build(BuildContext context) {
    double padding = MediaQuery.of(context).size.width * 0.15;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.titulo),
          backgroundColor: const Color(0xFF33333c),
        ),
        body: ListView.separated(
          itemCount: widget.elementos.length,
          padding:
              EdgeInsets.only(left: padding, right: padding, top: padding / 2),
          itemBuilder: (BuildContext context, int index) {
            String key = widget.elementos.keys.elementAt(index);
            if (widget.elementos[key] as bool) {
              //var controlador = TextEditingController();
              return Column(children: [
                CheckboxListTile(
                  checkColor: Colors.white,
                  activeColor: const Color(0xFF3ab480),
                  title: Text(key),
                  value: widget.elementos[key],
                  onChanged: (bool? value) {
                    setState(() {
                      widget.elementos[key] = value!;
                    });
                  },
                ),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Comentarios',
                  ),
                )
              ]);
            }
            return CheckboxListTile(
              checkColor: Colors.white,
              activeColor: const Color(0xFF3ab480),
              title: Text(key),
              value: widget.elementos[key],
              onChanged: (bool? value) {
                setState(() {
                  widget.elementos[key] = value!;
                });
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ));
  }
}

class ControlCabezal extends Control {
  @override
  String get titulo => "Control de Cabezal";
  @override
  Map<String, bool> get elementos => conductor.vehiculo.estadoCabezal;
  ControlCabezal({super.key, required super.conductor});
}

class ControlCisterna extends Control {
  @override
  String get titulo => "Control de Cisterna";
  @override
  Map<String, bool> get elementos => conductor.vehiculo.estadoCisterna;
  ControlCisterna({super.key, required super.conductor});
}
