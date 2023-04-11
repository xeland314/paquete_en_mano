class Item {
  String nombre = "";
  int cantidad = 0;
  bool obtenido = false;

  Item(this.nombre, this.cantidad);

  void agregarNombre(String nombre) {
    this.nombre = nombre;
  }

  void agregarCantidad(int cantidad) {
    this.cantidad = cantidad;
  }
}
