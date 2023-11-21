enum Environment { dev, staging, prod }

extension XEnvironment on Environment {
  bool get isProd => this == Environment.prod;

  bool get isStaging => this == Environment.staging;

  bool get isDev => this == Environment.dev;
}

class AppConfig {
  static Environment environment = Environment.dev;
  late String baseUrl;
  static String mapsApiKey = '';
  static String firebaseClientId = "";
  static String apiKey = "82dbe938b3288d8b49b774f6c080b349";
  static String imagePath = "https://image.tmdb.org/t/p/original";
  bool mock;

  AppConfig.dev({this.mock = false}) {
    environment = Environment.dev;
    baseUrl = 'https://api.themoviedb.org';
  }

  AppConfig.staging({this.mock = false}) {
    environment = Environment.staging;
    baseUrl = 'https://api.themoviedb.org';
  }

  AppConfig.prod({this.mock = false}) {
    environment = Environment.prod;
    baseUrl = 'https://api.themoviedb.org';
  }
}
