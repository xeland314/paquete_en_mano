import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:paquete_en_mano/api/auth_api.dart';
import 'package:paquete_en_mano/modules/main_page.dart';

@immutable
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _storage = const FlutterSecureStorage();
  final AuthApi _authApi = AuthApi();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('WanWay Tech Ecuador'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          margin: screenWidth < 600
              ? const EdgeInsets.all(32)
              : EdgeInsets.only(
                  left: screenWidth * 35 / 100, right: screenWidth * 35 / 100),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(labelText: 'Usuario'),
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return 'Ingresa tu usuario, por favor';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Contraseña'),
                  obscureText: true,
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return 'Ingresa tu contraseña, por favor';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Save the credentials securely
                      await _storage.write(
                          key: 'username', value: _usernameController.text);
                      await _storage.write(
                          key: 'password', value: _passwordController.text);

                      _authApi.username = _usernameController.text;
                      _authApi.password = _passwordController.text;

                      // Request a token using the AuthApi instance
                      final token = await _authApi.post();
                      final completer = Completer<void>();
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        final navigator = Navigator.of(context);
                        if (token.startsWith('Error')) {
                          // Show an error message
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Credenciales inválidas.')),
                          );
                        } else if (token.startsWith('Exception')) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'No se pudo conectar a internet. Revisa tu conexión.'),
                                showCloseIcon: true),
                          );
                        } else {
                          // Save the token securely
                          _storage.write(key: 'token', value: token);
                          // Navigate to the second screen
                          navigator.push(MaterialPageRoute(
                              builder: (context) => const Dashboard()));
                        }
                        completer.complete();
                      });
                      await completer.future;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo, // Background color
                  ),
                  child: const Text('Ingresar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
