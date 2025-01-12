import 'package:domain/domain.dart';
import 'package:domain/repositories/open_weather_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/blocs/home_screen/home_screen_bloc.dart';
import 'package:weather_app/dependency_injection/dependency_injection.dart';
import 'package:weather_app/screens/home_screen.dart';

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
    return BlocProvider(
      create: (_) => HomeScreenBloc(
        WeatherDetailsUseCase(
          GetIt.I.get<OpenWeatherRepository>(),
        ),
      )..add(GetForecastData()),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
            builder: (context, state) {
              if (state is HomeScreenErrorState) {
                return Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<HomeScreenBloc>().add(GetForecastData());
                    },
                    child: Text("Retry"),
                  ),
                );
              }
              if (state is HomeScreenLoadedState) {
                return HomeScreen(
                  unit: state.unit,
                  weather: state.weatherData.current,
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
