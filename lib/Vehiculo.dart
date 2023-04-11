class Vehiculo {
  String placa;
  late bool operativo;
  
  // false : sin problemas, true : problemas
  Map<String, bool> estadoCabezal = {
    "Conexiones de Frenos de aire" : false,
    "Compresor de aire" : false,
    "Líneas de aire" : false,
    "Batería" : false,
    "Carrocería" : false,
    "Accesorios de Freno" : false,
    "Presión Aire o Vacío" : false,
    "Reforzador de Freno < 3mm" : false,
    "Luz de Fallo de Freno" : false,
    "Pedal de Freno" : false,
    "Fluido Hidráulico" : false,
    "Freno de Estacionamiento" : false,
    "Embrague" : false,
    "Calentador" : false,
    "Equipo de Entrega" : false,
    "Transmisión" : false,
    "Presión de Aceite" : false,
    "Equipo de Emergencia" : false,
    "Motor" : false,
    "Sistema de Escape" : false,
    "Quinta rueda" : false,
    "Eje Delantero" : false,
    "Sistema Combustible" : false,
    "Alternador" : false,
    "Bocina" : false,
    "Luces y reflectores" : false,
    "Otros" : false,
  };

  Map<String, bool> estadoCisterna = {
    "Conexión de Aire a Frenos" : false,
    "Freno de Estacionamiento < 3mm" : false,
    "Patas" : false,
    "Luces y Reflectores" : false,
    "Tanque" : false,    
    "Equipo de Entrega" : false,
    "Suspensión, Resortes, Bolsas de Aire y Acoples Controladores" : false,
    "Equipo de Remolque y Acople" : false,
    "Neumáticos, presión Correcta, Banda" : false,
    "Neumáticos, Ruedas y Sostenedores" : false,
    "Alarma de Retroceso" : false,
    "Otros" : false   
  };
  
  Vehiculo(this.placa) {
    operativo = false;
  }

  void reiniciarEstados() {
    for (bool valor in estadoCabezal.values) {
      valor = false;
    }
    for (bool valor in estadoCisterna.values) {
      valor = false;
    }
  }
}