import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

final class AuthApi {
  final String _baseUrl = kReleaseMode
      ? 'http://127.0.0.1:8000'
      : 'https://acvtestsys.onrender.com';
  late String _username;
  late String _password;

  AuthApi();

  set username(String value) => _username = value;
  set password(String value) => _password = value;

  Future<String> post() async {
    try {
      final client = Client();
      final response = await client.post(
        Uri.parse('$_baseUrl/api_generate_token/'),
        body: {'username': _username, 'password': _password},
      );
      client.close();
      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        return data['token'];
      } else {
        return 'Error(${response.statusCode})';
      }
    } catch (exception, stacktrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stacktrace,
      );
      return 'Exception: $exception';
    }
  }
}
