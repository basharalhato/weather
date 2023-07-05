import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unit_one_weather/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:unit_one_weather/features/home/domain/entities/weather_data.dart';
import 'package:unit_one_weather/features/home/domain/repository/i_home_repository.dart';

final homeRepoProvider = Provider<IHomeRepository>(
  (ref) => HomeRepository(
    remoteDataSource: ref.watch(homeRemoteDataSourceProvider),
  ),
);

class HomeRepository extends IHomeRepository {
  final IHomeRemoteDataSource remoteDataSource;

  HomeRepository({required this.remoteDataSource});

  @override
  Future<WeatherData> getWeather(double lat, double lang) async {
    final data = await remoteDataSource.getWeather(lat, lang);
    return data.weatherData;
  }
}
