import 'package:dio/dio.dart';
import 'package:mobile/core/network/end_points.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/upcoming_movies_response.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_api_client.g.dart';

@RestApi()
abstract class RestAPIClient {
  factory RestAPIClient(Dio dio, {String baseUrl}) = _RestAPIClient;


  @GET(Endpoints.upcomingMoviesList)
  Future<UpcomingMoviesResponse> getAllUpcomingMovies(@Query('api_key') String apiKey);


}
