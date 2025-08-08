import 'package:flutter/material.dart';
import 'package:rick_and_morty_flutter_test/routing/router.dart';
import 'package:rick_and_morty_flutter_test/core/di/injection.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _router = buildRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
      routerConfig: _router,
    );
  }
}
