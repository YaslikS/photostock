import 'package:json_annotation/json_annotation.dart';

part 'urls.g.dart';

/// {@template urls.class}
/// DTO for link to the photo.
/// {@endtemplate}
@JsonSerializable(explicitToJson: true)
class Urls {
  /// link
  final String regular;

  /// {@macro urls.class}
  const Urls({
    required this.regular,
  });

  /// Get DTO object from json.
  factory Urls.fromJson(Map<String, dynamic> json) => _$UrlsFromJson(json);

  /// Convert a DTO object to json.
  Map<String, dynamic> toJson() => _$UrlsToJson(this);
}
