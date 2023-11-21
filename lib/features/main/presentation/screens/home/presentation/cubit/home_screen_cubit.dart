import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/main/presentation/screens/home/domain/repository/home_repository.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/states/home_screen_states.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {


  HomeScreenCubit({
    required this.repository,
  }) : super(const HomeScreenStates.initial());
  final HomeRepository repository;

  void getUpcomingMovies() async {
    emit(const HomeScreenStates.loading());
    try {
      final response = await repository.getUpcommingMovies();
      emit(
        HomeScreenStates.onResponse(response),
      );
    } on DioException catch (e) {
      emit(HomeScreenStates.onError(e.message.toString()));
    }
  }
  
}