import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unit_one_weather/core/data/network/api_config.dart';
import 'package:unit_one_weather/core/data/network/dio_provider.dart';
import 'package:unit_one_weather/core/extentions/map_error.dart';
import 'package:unit_one_weather/features/home/domain/entities/weather_response.dart';

abstract class IHomeRemoteDataSource {
  Future<WeatherResponse> getWeather(double lat, double lang);
}

final homeRemoteDataSourceProvider = Provider<IHomeRemoteDataSource>(
  (ref) => HomeRemoteDataSource(
    ref.watch(dioProvider),
  ),
);

class HomeRemoteDataSource implements IHomeRemoteDataSource {
  HomeRemoteDataSource(this.client);

  final Dio client;

  @override
  Future<WeatherResponse> getWeather(double lat, double lang) async {
    return await _tryCatchWrapper(() async {
      final Response response = await client.get(
        ApiConfig.homePath,
        queryParameters: {'latitude': lat, 'longitude': lang},
      );
      return WeatherResponse.fromJson(response.data);
    });
  }

  Future<T> _tryCatchWrapper<T>(Future<T> Function() body) async {
    try {
      return await body();
    } on Exception catch (e) {
      throw e.mapErrorToServerException();
    }
  }
}
