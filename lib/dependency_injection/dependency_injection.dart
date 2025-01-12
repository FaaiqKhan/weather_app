import 'package:domain/repositories/open_weather_repository.dart';
import 'package:get_it/get_it.dart';

class DependencyInjection {
  DependencyInjection._();

  static void initDependencies() {
    GetIt.I.registerSingleton<OpenWeatherRepository>(
      OpenWeatherRepository(),
    );
  }
}
