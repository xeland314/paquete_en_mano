import 'Vehiculo.dart';

class Conductor {
  late Vehiculo vehiculo;
  String nombre;

  Conductor(this.nombre);
  Conductor.vehiculo(this.nombre, this.vehiculo);

  void asignarVehiculo(Vehiculo vehiculo) {
    this.vehiculo = vehiculo;
  }

  @override
  String toString() {
    return nombre;
  }
}
