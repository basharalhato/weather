import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unit_one_weather/core/domain/base_use_case.dart';
import 'package:unit_one_weather/features/home/data/repository/home_repository.dart';
import 'package:unit_one_weather/features/home/domain/entities/weather_data.dart';
import 'package:unit_one_weather/features/home/domain/mappers/weather_mapper.dart';
import 'package:unit_one_weather/features/home/domain/repository/i_home_repository.dart';

final getWeatherUCProvider = Provider(
  (ref) => GetWeatherUC(
    ref,
    homeRepo: ref.watch(homeRepoProvider),
  ),
);

class GetWeatherUC implements UseCaseBase<List<PositionedWeatherData>, (double, double)> {
  GetWeatherUC(this.ref, {required this.homeRepo});

  final Ref ref;
  final IHomeRepository homeRepo;

  @override
  Future<List<PositionedWeatherData>> call((double, double) location) async {
    final weatherData = await homeRepo.getWeather(location.$1, location.$2);
    return weatherData.mapWeatherData();
  }
}
