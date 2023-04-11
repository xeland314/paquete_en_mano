import 'Cliente.dart';

class Conductor {
  List<Cliente>? viajes = List.empty(growable: true);

  void agregarLista(Cliente cliente) {
    this.viajes!.add(cliente);
  }
}
