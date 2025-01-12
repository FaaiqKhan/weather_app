import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/home_screen/home_screen_bloc.dart';
import 'package:weather_app/enums/enums.dart';

class TemperatureUnitMenu extends StatelessWidget {
  const TemperatureUnitMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) {
        if (state is HomeScreenLoadedState) {
          return PopupMenuButton<TemperatureUnit>(
            initialValue: state.unit,
            onSelected: (value) => context
                .read<HomeScreenBloc>()
                .add(SwitchTemperatureUnit(value)),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: TemperatureUnit.celsius,
                  child: Text("Celsius"),
                ),
                PopupMenuItem(
                  value: TemperatureUnit.fahrenheit,
                  child: Text("Fahrenheit"),
                )
              ];
            },
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
