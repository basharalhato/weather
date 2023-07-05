abstract class ApiConfig {
  static const String weatherBaseUrl = 'https://api.open-meteo.com/v1';

  /// paths
  static const String homePath =
      '/forecast?latitude=52.52&longitude=13.41&timezone=IST&daily=apparent_temperature_max';

  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 20);

  static const applicationJsonContentType = 'application/json';
}
