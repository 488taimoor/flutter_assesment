import 'package:kiwi/kiwi.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/cubit/home_screen_cubit.dart';

abstract class CubitModule {
  static late KiwiContainer _container;

  static void setup(KiwiContainer container) {
    _container = container;
    _registerHomeScreenCubit();
  }

  static void _registerHomeScreenCubit() {
    _container.registerSingleton(
          (_) => HomeScreenCubit(
        repository: _container.resolve(),
      ),
    );
  }

}
