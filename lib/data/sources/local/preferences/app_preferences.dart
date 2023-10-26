import 'package:mobile/core/persistence/preferences/base_preferences.dart';

class AppPreferences extends BasePreferences {
  final _appFreshInstallKey = 'APP_FRESH_INSTALL';
  final _accessTokenKey = 'ACCESS_TOKEN';
  final _refreshTokenKey = 'REFRESH_TOKEN';

  void setAppFreshInstall() {
    store(_appFreshInstallKey, true);
  }

  bool isAppFreshInstall() {
    final value = retrieve<bool>(_appFreshInstallKey);
    if (value != null) {
      return false;
    }
    return true;
  }

  void saveUserAccessToken(String? token) {
    store(_accessTokenKey, token);
  }

  String? getUserAccessToken() {
    return retrieve<String>(_accessTokenKey);
  }

  void saveUserRefreshToken(String? token) {
    store(_refreshTokenKey, token);
  }

  String? getUserRefreshToken() {
    return retrieve<String>(_refreshTokenKey);
  }

  void clearUserSession() {
    removeAll();
  }
}
