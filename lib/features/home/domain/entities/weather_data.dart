// ignore_for_file: invalid_annotation_target

import 'dart:core';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unit_one_weather/features/home/domain/entities/weather.dart';
import 'package:unit_one_weather/features/home/domain/mappers/weather_mapper.dart';

part 'weather_data.freezed.dart';
part 'weather_data.g.dart';

@freezed
class WeatherData with _$WeatherData {
  factory WeatherData({
    @Default([]) List<String> time,
    @Default([])
    @JsonKey(name: 'apparent_temperature_max')
    List<double> temperatures,
  }) = _WeatherData;

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);
}

extension Mapper on WeatherData {
  List<PositionedWeatherData> mapWeatherData() {
    final List<PositionedWeatherData> list = [];
    time.asMap().forEach(
      (index, value) {
        final temperature = temperatures[index];

        list.add(
          PositionedWeatherData(
            position: index,
            data: Weather(
              date: value,
              temperatureCelsius: temperature,
            ),
          ),
        );
      },
    );
    return list;
  }
}
