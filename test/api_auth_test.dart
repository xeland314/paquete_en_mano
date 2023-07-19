import 'package:paquete_en_mano/api/auth_api.dart';

Future<void> main() async {
  AuthApi api = AuthApi();
  api.username = 'xeland314';
  api.password = 'cavp4618X';

  String token = await api.post();
  if (token.startsWith('Error')) {}
}
