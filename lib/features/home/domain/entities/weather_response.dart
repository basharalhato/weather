// ignore_for_file: invalid_annotation_target

import 'dart:core';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unit_one_weather/features/home/domain/entities/weather_data.dart';

part 'weather_response.freezed.dart';
part 'weather_response.g.dart';

@freezed
class WeatherResponse with _$WeatherResponse {
  factory WeatherResponse({
    @JsonKey(name: 'daily') required WeatherData weatherData,
  }) = _WeatherResponse;

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);
}
