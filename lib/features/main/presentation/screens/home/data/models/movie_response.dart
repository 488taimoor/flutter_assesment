import 'package:json_annotation/json_annotation.dart';

part 'movie_response.g.dart';


@JsonSerializable(createToJson: false)
class Movie {

  int vote_count;
  double vote_average;
  bool video;
  String title;
  String release_date;
  String poster_path;
  double popularity;
  String overview;
  String original_title;
  String original_language;
  int id;
  List<int> genre_ids;
  String backdrop_path;
  bool adult;


  Movie(this.id,this.title,this.adult, this.backdrop_path,this.genre_ids,this.original_language,this.original_title,this.overview,this.popularity,this.poster_path,this.release_date,this.video,this.vote_average,this.vote_count);

  factory Movie.fromJson(Map<String, dynamic> json) =>
      _$MovieFromJson(json);
}