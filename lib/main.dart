import 'package:flutter/material.dart';
import 'package:paquete_en_mano/modules/login/login.dart';
import 'package:paquete_en_mano/modules/main_page.dart';

import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://14709be2765f463a99639f49605cc014@o4505540711743488.ingest.sentry.io/4505540716396544';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(const MyApp()),
  );
  // or define SENTRY_DSN via Dart environment variable (--dart-define)
}

final routes = {
  '/login': (context) => const LoginPage(),
  '/dashboard': (context) => const Dashboard(),
};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ACV System', home: const LoginPage(), routes: routes);
  }
}
