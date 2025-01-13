import 'package:flutter/material.dart';
import 'package:weather_app/dependency_injection/dependency_injection.dart';
import 'package:weather_app/screens/main_screen.dart';

void main() {
  DependencyInjection.initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
