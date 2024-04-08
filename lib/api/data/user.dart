import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  String username;

  User({required this.username});

  // From Json
  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  // ToJson
  Map<String, dynamic> toJson() => _$UserToJson(this);
}