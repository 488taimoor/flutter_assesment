// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming_movies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpcomingMoviesResponse _$UpcomingMoviesResponseFromJson(
        Map<String, dynamic> json) =>
    UpcomingMoviesResponse(
      (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['page'] as int,
      json['total_pages'] as int,
      json['total_results'] as int,
    );
