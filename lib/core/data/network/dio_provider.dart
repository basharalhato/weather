import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:unit_one_weather/core/data/network/api_config.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio()
    ..options = BaseOptions(
      baseUrl: ApiConfig.weatherBaseUrl,
      connectTimeout: ApiConfig.connectTimeout,
      receiveTimeout: ApiConfig.receiveTimeout,
    )
    ..interceptors.add(
      PrettyDioLogger(),
    );
});
