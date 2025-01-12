import 'package:flutter/material.dart';

class BriefWeatherWidget extends StatelessWidget {
  const BriefWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text("Fri"),
          Image.network("https://openweathermap.org/img/wn/10d@2x.png"),
          Text("34/22"),
        ],
      ),
    );
  }
}