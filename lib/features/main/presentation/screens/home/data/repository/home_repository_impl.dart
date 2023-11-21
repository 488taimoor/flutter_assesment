import 'package:mobile/app/app_config.dart';
import 'package:mobile/core/network/rest_api_client.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/upcoming_movies_response.dart';
import 'package:mobile/features/main/presentation/screens/home/domain/repository/home_repository.dart';


class HomeRepositoryImplementation extends HomeRepository {
  HomeRepositoryImplementation({
    required this.restAPIClient,
  });

  final RestAPIClient restAPIClient;



  @override
  Future<UpcomingMoviesResponse> getUpcommingMovies()async {
    return await restAPIClient.getAllUpcomingMovies(AppConfig.apiKey);
  }





}
