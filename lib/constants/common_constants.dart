class AuthConstants {
  static const ACCESS_TOKEN_KEY = "access_token";
  static const REFRESH_TOKEN_KEY = "refresh_token";
  static const IS_GOOGLE_SIGNIN_KEY = "is_google_signin";
  static const OTP_TRY_AFTER_SECONDS = 60;
  static const PIN_TRY_AFTER_SECONDS = 30;
  static const PIN_DIGIT = 5;
  static const API_HEADER_APP_OS = "app-os";
  static const API_HEADER_DEVICE_NAME = "device-name";
  static const API_HEADER_DEVICE_ID = "device-id";
}

class AppConstants {
  static const DEFAULT_LANGUAGE = 'en';
  static const COUNTRIES_FOR_DAILCODE = ["AE", "SA"];
  static const double marginSize = 20;
}

class ValidationConstants {
  static const REGEX_IS_DIGIT = r'\d';
  static const REGEX_IS_NUMERIC = r'^[0-9]+$';
}
