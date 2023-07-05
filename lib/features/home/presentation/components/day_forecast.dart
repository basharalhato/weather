import 'package:flutter/material.dart';

class DayForecast extends StatelessWidget {
  final String date;
  final String temp;
  const DayForecast({super.key, required this.date, required this.temp});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            date,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            temp,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
