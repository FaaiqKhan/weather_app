import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:weather_app/blocs/home_screen/home_screen_bloc.dart';
import 'package:weather_app/screens/home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeScreenBloc(
        WeatherDetailsUseCase(
          GetIt.I.get<OpenWeatherRepository>(),
        ),
      )..add(GetForecastData()),
      child: Scaffold(
        backgroundColor: Colors.white70,
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
                return SmartRefresher(
                  controller: context.read<HomeScreenBloc>().refreshController,
                  onRefresh: () =>
                      context.read<HomeScreenBloc>().add(RefreshForecastData()),
                  child: HomeScreen(),
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
