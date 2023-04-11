import 'dart:html';
import 'package:aplicacion/AplicacionCuerpo.dart';
import 'package:aplicacion/Cliente.dart';
import 'package:aplicacion/Draw.dart';
import 'package:aplicacion/HojaDeCompraCliente.dart';
import 'package:aplicacion/Conductor.dart';
import 'package:aplicacion/Item.dart';
import 'package:aplicacion/ListaDeViajesAceptados.dart';
import 'package:aplicacion/LoginPage.dart';
import 'package:flutter/material.dart';
import 'ControlVehiculo.dart';
import 'ListaDeViajesDisponibles.dart';
import 'PaginaCuenta.dart';
import 'PaginaDeRevisionViaje.dart';

TextStyle textoNormal = const TextStyle(
  color: Colors.black,
  fontSize: 18,
);
TextStyle textoGrande = const TextStyle(
    fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold);
TextStyle textoAppBar = textoGrande.copyWith(color: Colors.white);
TextStyle textoMediano = const TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold);
Conductor conductor = Conductor();

List<Widget> paginasDeNavegacion = [
  ListaDeViajesDisponibles(),
  ListaDeViajesAceptados(),
  PaginaCuenta(),
];

List<Cliente> clientes = [
  Cliente("Agripac", "Magdalena"),
  Cliente("Cosco", "Armenia"),
  Cliente("Bic", "Cumbaya")
];

List<Color> colores = [
  const Color.fromRGBO(153, 153, 153, 60),
  const Color.fromRGBO(191, 191, 191, 75)
];

void main() => runApp(const Aplicacion());

class Aplicacion extends StatelessWidget {
  const Aplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage()
      //initialRoute: '/',
      // routes: {
      //  '/': (context) => LoginPage(),
      //  '/AplicacionCuerpo': (context) => AplicacionCuerpo(),
      //}
    );
  }
}
