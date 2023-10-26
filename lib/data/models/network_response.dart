import 'package:json_annotation/json_annotation.dart';

part 'network_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkResponse {
  final String? message;

  NetworkResponse({this.message});

  factory NetworkResponse.fromJson(Map<String, dynamic> json) =>
      _$NetworkResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkResponseToJson(this);
}
