import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/movie_response.dart';

part 'upcoming_movies_response.g.dart';


@JsonSerializable(createToJson: false)
class UpcomingMoviesResponse {
  int page;
  List<Movie> results;
  int total_pages;
  int total_results;



  UpcomingMoviesResponse( this.results,this.page,this.total_pages,this.total_results);

  factory UpcomingMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$UpcomingMoviesResponseFromJson(json);
}

