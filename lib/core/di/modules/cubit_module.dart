import 'package:kiwi/kiwi.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/cubit/home_screen_cubit.dart';
import 'package:mobile/features/main/presentation/screens/main_screen.dart';

abstract class CubitModule {
  static late KiwiContainer _container;

  static void setup(KiwiContainer container) {
    _container = container;
    _registerHomeScreenCubit();
    _registerNavBarCubit();
  }

  static void _registerHomeScreenCubit() {
    _container.registerSingleton(
          (_) => HomeScreenCubit(
        repository: _container.resolve(),
      ),
    );
  }
  static void _registerNavBarCubit() {
    _container.registerSingleton((_) => NavBarCubit());
  }

}
