import 'package:unit_one_weather/features/home/domain/entities/weather.dart';

class PositionedWeatherData {
  final int position;
  final Weather data;

  PositionedWeatherData({
    required this.position,
    required this.data,
  });
}
