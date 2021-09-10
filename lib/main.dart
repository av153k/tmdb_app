import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmdb_app/pages/home_page.dart';
import 'package:tmdb_app/services/database_services.dart';
import 'package:tmdb_app/services/shared_preferences_services.dart';
import 'package:tmdb_app/services/snackbar_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesServices.service.initialize();
  await DatabaseServices.service.initialize();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  static final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      title: 'TMDb App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Builder(
        builder: (context) {
          SnackbarServices.service.scaffoldMessengerKey = scaffoldMessengerKey;
          return HomePage();
        },
      ),
    );
  }
}
