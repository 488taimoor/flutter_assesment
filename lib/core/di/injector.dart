import 'package:kiwi/kiwi.dart';
import 'package:mobile/app/app_config.dart';
import 'package:mobile/core/di/modules/app_module.dart';
import 'package:mobile/core/di/modules/cubit_module.dart';
import 'package:mobile/core/di/modules/network_module.dart';
import 'package:mobile/core/di/modules/repository_module.dart';

abstract class Injector {
  static final KiwiContainer _container = KiwiContainer();
  static final resolve = _container.resolve;

  static Future<void> setup({required AppConfig appConfig}) async {
    await AppModule.setup(_container);
    NetworkModule.setup(container: _container, appConfig: appConfig);
    RepositoryModule.setup(_container);
    CubitModule.setup(_container);
  }

  static void clear() {
    _container.clear();
  }
}
