

import 'package:mobile/features/main/presentation/screens/home/data/models/upcoming_movies_response.dart';

abstract class HomeRepository {
  Future<UpcomingMoviesResponse> getUpcommingMovies();

}
