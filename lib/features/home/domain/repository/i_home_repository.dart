import 'package:unit_one_weather/features/home/domain/entities/weather_data.dart';

abstract class IHomeRepository {
  Future<WeatherData> getWeather(double lat, double lang);
}
