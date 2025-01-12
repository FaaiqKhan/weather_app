import 'package:domain/domain.dart';
import 'package:domain/repositories/open_weather_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/dependency_injection/dependency_injection.dart';

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
      home: const MyHomePage(title: "Weather Mobile Application"),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              await WeatherDetailsUseCase(
                GetIt.I.get<OpenWeatherRepository>(),
              ).getWeatherDetails(
                lat: 52.4633188,
                lon: 13.3405259,
              );
            },
            child: Text("Get weather details"),
          ),
        ),
      ),
    );
  }
}
