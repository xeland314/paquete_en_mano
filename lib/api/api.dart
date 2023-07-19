import 'dart:convert';

import 'package:http/http.dart';
import 'package:paquete_en_mano/api/interface.dart';

abstract class Api implements ApiInterface {
  final String _baseUrl = 'http://127.0.0.1:8000';
  final String _token;

  Api(this._token);

  @override
  Future get(String path) async {
    final client = Client();
    final response = await client.get(
      Uri.parse('$_baseUrl/$path'),
      headers: {'Authorization': 'Token $_token'},
    );
    client.close();
    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      return data;
    } else {
      return 'Error(${response.statusCode})';
    }
  }

  @override
  Future post(String path, dynamic data) async {
    final client = Client();
    final response = await client.post(
      Uri.parse('$_baseUrl/$path'),
      headers: {'Authorization': 'Token $_token'},
      body: data,
    );
    client.close();
    if (response.statusCode == 201) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      return data;
    } else {
      return 'Error(${response.statusCode})';
    }
  }

  @override
  Future delete(String path) async {
    final client = Client();
    final response = await client.delete(
      Uri.parse('$_baseUrl/$path'),
      headers: {'Authorization': 'Token $_token'},
    );
    client.close();
    if (response.statusCode == 204) {
      return null;
    } else {
      return 'Error(${response.statusCode})';
    }
  }

  @override
  Future update(String path, dynamic data) async {
    final client = Client();
    final response = await client.put(
      Uri.parse('$_baseUrl/$path'),
      headers: {'Authorization': 'Token $_token'},
      body: data,
    );
    client.close();
    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      return data;
    } else {
      return 'Error(${response.statusCode})';
    }
  }
}
