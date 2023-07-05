import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unit_one_weather/features/home/domain/mappers/weather_mapper.dart';
import 'package:unit_one_weather/features/home/domain/use_cases/home_uc.dart';

final homeProvider = FutureProvider.autoDispose
    .family<List<PositionedWeatherData>, (double, double)>((ref, location) {
  final weather = ref.watch(getWeatherUCProvider).call(location);
  return weather;
});
