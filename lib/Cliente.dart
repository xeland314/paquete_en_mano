import 'package:aplicacion/Item.dart';

class Cliente {
  String nombre = "";

  String direccion = "";
  List<Item> items = List.empty(growable: true);

  Cliente(this.nombre, this.direccion) {
    items.add(Item("Nombre", 3));
    items.add(Item("Compra", 3));
  }

  void agregarElementos(Item item) {
    items.add(item);
  }
}
