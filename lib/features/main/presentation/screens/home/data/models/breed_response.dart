import 'package:json_annotation/json_annotation.dart';

part 'breed_response.g.dart';


@JsonSerializable(createToJson: false)
class BreedResponse {
  List<String> message;
  String status;

  BreedResponse(this.message, this.status);

  factory BreedResponse.fromJson(Map<String, dynamic> json) =>
      _$BreedResponseFromJson(json);
}