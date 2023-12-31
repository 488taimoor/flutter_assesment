import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/upcoming_movies_response.dart';

part 'home_screen_states.freezed.dart';

@Freezed()
class HomeScreenStates with _$HomeScreenStates {
  const factory HomeScreenStates.initial() = initial;
  const factory HomeScreenStates.loading() = showloading;
  const factory HomeScreenStates.onError(String? error) = showError;
  const factory HomeScreenStates.onResponse(UpcomingMoviesResponse upcomingMoviesResponse) = onResponse;
}
