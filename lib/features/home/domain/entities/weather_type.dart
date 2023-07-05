class WeatherType {
  static String toText(int code) {
    switch (code) {
      case 0:
        return "ClearSky";
      case 1:
        return "MainlyClear";
      case 2:
        return "PartlyCloudy";
      case 3:
        return "Overcast";
      case 45:
        return "Foggy";
      case 48:
        return "DepositingRimeFog";
      case 51:
        return "LightDrizzle";
      case 53:
        return "ModerateDrizzle";
      case 55:
        return "DenseDrizzle";
      case 56:
        return "LightFreezingDrizzle";
      case 57:
        return "DenseFreezingDrizzle";
      case 61:
        return "SlightRain";
      case 63:
        return "ModerateRain";
    }
    return 'ClearSky';
  }
}
