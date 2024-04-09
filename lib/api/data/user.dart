import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

/// {@template user.class}
/// DTO for the user who posted the photo
/// {@endtemplate}
@JsonSerializable(explicitToJson: true)
class User {
  /// name of user
  final String username;

  /// {@macro user.class}
  const User({
    required this.username,
  });

  /// Get DTO object from json.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Convert a DTO object to json.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
