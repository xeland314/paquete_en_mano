import 'package:aplicacion/AplicacionCuerpo.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:collection';

 
String dropdownValue = 'Adminitratico';


class LoginPage extends StatefulWidget {
  static String id = 'login_page';
  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: Column(
          children:[
            DropdownButton(
              value: dropdownValue,
              items: [
                DropdownMenuItem(child: Text('Administrativo'), value: 'Administrativo'),
                DropdownMenuItem(child: Text('Conductor'), value: 'Conductor'),
                DropdownMenuItem(child: Text('Supervisor'), value: 'Supervisor'),
              ], 
              
              onChanged: (String? value){
                setState(() {
                  dropdownValue = value!;
                });
              }),
           //Image.asset('images/logo.png'),
           SizedBox(height: 15.0,),
            _userTextField(),
            SizedBox(height:15,),
            _passwordTextField(),
            SizedBox(height: 20.0,),
            _bottonLogin(),
          ]
        ),
      )
    );
  }

  Widget _userTextField(){
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding:  EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'ejemplo@correo.com',
              labelText: 'Correo electronico',
            ),
            onChanged: (value){
              
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
            keyboardType: TextInputType.emailAddress,
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.key),
              hintText: 'contraseña',
              labelText: 'contraseña',
            ),
            onChanged: (value){
              
            },
            ),
        );
      }
    );
  }
  
  Widget _bottonLogin() {
    return ElevatedButton(
      onPressed: (){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context)=>AplicacionCuerpo())
         ); 
      }, child: Text('login')
      );
  }
}

