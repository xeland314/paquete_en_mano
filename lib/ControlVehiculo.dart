import 'package:aplicacion/main.dart';
import 'package:flutter/material.dart';

class ControlLuces extends StatefulWidget {
  const ControlLuces({super.key});

  @override
  ControlLucesEstado createState() => ControlLucesEstado();
}

class ControlLucesEstado extends State<ControlLuces> {
  String titulo = "Control de Luces";  
  Map<String, bool> elementos = {
        "Frontales (altas, medianas, bajas)" : false,
      "Luces rompe neblina" : false,
      "Luces direccionales delanteras" : false,
      "Luces direccionales traseras" : false,
      "Luces intermitentes delanteras" : false,    
      "Luces intermitentes traseras" : false,
      "Luces de freno" : false  
  };

  @override
  Widget build(BuildContext context) {
    double padding = MediaQuery.of(context).size.width * 0.15;
    return Scaffold(
        appBar: AppBar(
          title: Text(titulo, style: textoAppBar,),
          backgroundColor: Colors.black,
        ),
        body: ListView.separated(
          itemCount: elementos.length,
          padding: EdgeInsets.only(left: padding, right: padding, top: padding / 2),
          itemBuilder: (BuildContext context, int index) { 
              String key = elementos.keys.elementAt(index);
              return CheckboxListTile(
                checkColor: Colors.white,
                activeColor: Colors.black, 
                title: Text(key),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 0.5),
                  borderRadius: BorderRadius.circular(20),
                ), 
                value: elementos[key],
                onChanged: (bool? value) {
                  setState(() {
                    elementos[key] = value!;
                  });
                },
              );
          }, 
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        )
    );
  }
  
  bool puedeAvanzar() {
    for (bool valor in elementos.values) {
      if (!valor) {
        return valor;
      }
    }
    return true;
  }
}

class ControlCabina extends StatefulWidget {
  const ControlCabina({super.key});

  @override
  ControlCabinaEstado createState() => ControlCabinaEstado();
}

class ControlCabinaEstado extends State<ControlCabina> {
  String titulo = "Control de Cabina";  
  Map<String, bool> elementos = {
      "Vidrio Frontal/lateral/trasera" : false,
      "Limpia Brisas" : false,
      "Parasoles" : false,
      "Espejo retrovisor o central" : false,
      "Espejos laterales" : false,    
      "Cinturon de Seguridad" : false,
      "Pito de retroceso" : false,
      "Asientos delanteros y traseros" : false,
      "Llantas y llantas de repuesto" : false  
  };

  @override
  Widget build(BuildContext context) {
    double padding = MediaQuery.of(context).size.width * 0.15;
    return Scaffold(
        appBar: AppBar(
          title: Text(titulo, style: textoAppBar,),
          backgroundColor: Colors.black,
        ),
        body: ListView.separated(
          itemCount: elementos.length,
          padding: EdgeInsets.only(left: padding, right: padding, top: padding / 2),
          itemBuilder: (BuildContext context, int index) { 
              String key = elementos.keys.elementAt(index);
              return CheckboxListTile(
                checkColor: Colors.white,
                activeColor: Colors.black, 
                title: Text(key),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 0.5),
                  borderRadius: BorderRadius.circular(20),
                ), 
                value: elementos[key],
                onChanged: (bool? value) {
                  setState(() {
                    elementos[key] = value!;
                  });
                },
              );
          }, 
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        )
    );
  }
  
  bool puedeAvanzar() {
    for (bool valor in elementos.values) {
      if (!valor) {
        return valor;
      }
    }
    return true;
  }
}