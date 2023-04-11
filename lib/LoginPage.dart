import 'package:aplicacion/Draw.dart';
import 'package:aplicacion/ListaDeViajesDisponibles.dart';
import 'package:aplicacion/Supervisor.dart';
import 'package:flutter/material.dart';
import 'AplicacionCuerpo.dart';
import 'main.dart';
import 'Usuarios.dart';
import 'Administrativo.dart';
//
String dropdownValue = "Administrativo";
String _nombre = '';
String _contrasena = '';
Usuarios usuarioAux = new Supervisor();
//
class LoginPage extends StatefulWidget {
  static String id = 'login_page';
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    Scaffold(
      body: Center(
        child: Column(
          children:[
           //Image.asset('images/logo.png'),
           DropdownButton(
            value: dropdownValue,

            items:const[
              DropdownMenuItem(child: Text('Administrativo'), value: 'Administrativo'),
              DropdownMenuItem(child: Text('Conductor'), value: 'Conductor'),
              DropdownMenuItem(child: Text('Supervisor'), value: 'Supervisor'),
            ], 
           onChanged: (value){
            setState(() {
          dropdownValue = value!;
        });
           }
           ),
           SizedBox(height: 15.0,),
            _userTextField(),
            SizedBox(height:15,),
            _passwordTextField(),
            SizedBox(height: 20.0,),
            _bottonLogin(),
          ]
        ),
      )
    ),
    );
  }

  Widget _userTextField(){
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding:  EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'Juanito',
              labelText: 'Correo electronico',
            ),
            onChanged: (value){
              setState(() {
                _nombre = value;
              });
            },
            ),
        );
      }
    );
  }

  Widget _passwordTextField(){
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding:  EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.key),
              hintText: '12345',
              labelText: 'contraseña',
            ),
            onChanged: (value){
              setState(() {
                _contrasena = value;
              });
            },
            ),
        );
      }
    );
  }
  
  Widget _bottonLogin() {
    return ElevatedButton(
      onPressed: (){
        if (dropdownValue == 'Supervisor'){
          if( usuarioAux.validacionUsuario(_nombre, _contrasena)){
            return;
          }
        }
      Navigator.pushAndRemoveUntil(
       context,
        MaterialPageRoute(
          builder: (BuildContext context) => Draw()),
            ModalRoute.withName('/Draw'));
      }, child: Text('login')
      );
  }
}
