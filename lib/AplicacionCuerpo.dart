import 'package:flutter/material.dart';

import 'main.dart';

class AplicacionCuerpo extends StatefulWidget {
  const AplicacionCuerpo({
    Key? key,
  }) : super(key: key);
  @override
  State<AplicacionCuerpo> createState() => _AplicacionCuerpoState();
}

class _AplicacionCuerpoState extends State<AplicacionCuerpo> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: paginasDeNavegacion[index],
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.black,
          onTap: (index) {
            setState(() {
              this.index = index;
            });
          },
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
                icon: index == 0
                    ? const Icon(
                        Icons.home,
                        color: Colors.black,
                      )
                    : const Icon(
                        Icons.home,
                        color: Colors.black45,
                      ),
                label: "Inicio"),
            BottomNavigationBarItem(
                icon: index == 1
                    ? const Icon(
                        Icons.car_repair,
                        color: Colors.black,
                      )
                    : const Icon(
                        Icons.car_repair,
                        color: Colors.black45,
                      ),
                label: "Viajes"),
            BottomNavigationBarItem(
                icon: index == 2
                    ? const Icon(
                        Icons.person,
                        color: Colors.black,
                      )
                    : const Icon(
                        Icons.person,
                        color: Colors.black45,
                      ),
                label: "Cuenta")
          ]),
    );
  }
}