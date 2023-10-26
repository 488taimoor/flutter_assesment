

import 'package:mobile/features/main/presentation/screens/home/data/models/breed_response.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/random_response.dart';

abstract class HomeRepository {
  Future<RandomResponse> getBreedByRandom();

  Future<BreedResponse> getListByBreed(String breed_name);
}
