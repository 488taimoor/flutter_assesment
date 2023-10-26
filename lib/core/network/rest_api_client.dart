import 'package:dio/dio.dart';
import 'package:mobile/core/network/end_points.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/breed_response.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/random_response.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_api_client.g.dart';

@RestApi()
abstract class RestAPIClient {
  factory RestAPIClient(Dio dio, {String baseUrl}) = _RestAPIClient;


  @GET(Endpoints.randomImageByBreed)
  Future<RandomResponse> getBreedByRandom();

  @GET(Endpoints.imagesListByBreed)
  Future<BreedResponse> getListByBreed(@Path('breed_name') breed_name);

  ///
  /// Api endpoints of Google Geocoder services
  ///
}
