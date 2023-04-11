
import 'dart:collection';
import 'dart:collection';

abstract class Usuarios{
  
  var consumidores;

  validacionUsuario(String nombre, String contrasena){
    consumidores.forEach((key, value){
      if(key == nombre && value == value){
        return true;
      }else{
      return false;
      }
    });
  }
}