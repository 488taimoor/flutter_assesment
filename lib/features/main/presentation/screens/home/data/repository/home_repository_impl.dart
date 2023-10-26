import 'package:mobile/core/network/rest_api_client.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/breed_response.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/random_response.dart';
import 'package:mobile/features/main/presentation/screens/home/domain/repository/home_repository.dart';


class HomeRepositoryImplementation extends HomeRepository {
  HomeRepositoryImplementation({
    required this.restAPIClient,
  });

  final RestAPIClient restAPIClient;

  @override
  Future<RandomResponse> getBreedByRandom() async {
    return await restAPIClient.getBreedByRandom();
  }

  @override
  Future<BreedResponse> getListByBreed(String breed_name) async {
    return await restAPIClient.getListByBreed(breed_name);
  }



}
