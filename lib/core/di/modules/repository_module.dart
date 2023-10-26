import 'package:kiwi/kiwi.dart';
import 'package:mobile/features/main/presentation/screens/home/data/repository/home_repository_impl.dart';
import 'package:mobile/features/main/presentation/screens/home/domain/repository/home_repository.dart';


abstract class RepositoryModule {
  static late KiwiContainer _container;

  static void setup(KiwiContainer container) {
    _container = container;
    _setupHomeRepository();
  }


  static void _setupHomeRepository() {
    _container.registerSingleton<HomeRepository>(
          (_) => HomeRepositoryImplementation(
        restAPIClient: _container.resolve(),
      ),
    );
  }
}
