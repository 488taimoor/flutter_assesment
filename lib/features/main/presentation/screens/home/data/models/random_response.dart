import 'package:json_annotation/json_annotation.dart';

part 'random_response.g.dart';


@JsonSerializable(createToJson: false)
class RandomResponse {
  String message;
  String status;

  RandomResponse(this.message, this.status);

  factory RandomResponse.fromJson(Map<String, dynamic> json) =>
      _$RandomResponseFromJson(json);
}