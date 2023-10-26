import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/main/presentation/screens/home/domain/repository/home_repository.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/states/home_screen_states.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {


  HomeScreenCubit({
    required this.repository,
  }) : super(const HomeScreenStates.initial());
  final HomeRepository repository;

  String breedName = "";


  void getRandomImageByBreed() async {
    emit(const HomeScreenStates.loading());
    try {
      final response = await repository.getBreedByRandom();
      breedName = response.message.split("/")[4].split("-")[0];
      emit(
        HomeScreenStates.onRandomBreed(response),
      );
    } on DioException catch (e) {
      emit(HomeScreenStates.onError(e.message.toString()));
    }
  }

  void getBreedList(String breed_name) async {
    emit(const HomeScreenStates.loading());
    try {
      final response = await repository.getListByBreed(breed_name);
      emit(
        HomeScreenStates.onBreedList(response),
      );
    } on DioException catch (e) {
      emit(HomeScreenStates.onError(e.message.toString()));
    }
  }
  
}