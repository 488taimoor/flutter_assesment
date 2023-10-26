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
  bool mock;

  AppConfig.dev({this.mock = false}) {
    environment = Environment.dev;
    baseUrl = 'https://dog.ceo/api';
  }

  AppConfig.staging({this.mock = false}) {
    environment = Environment.staging;
    baseUrl = 'https://dog.ceo/api';
  }

  AppConfig.prod({this.mock = false}) {
    environment = Environment.prod;
    baseUrl = 'https://dog.ceo/api';
  }
}
