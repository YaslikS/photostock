import 'package:flutter_template/api/data/urls.dart';
import 'package:flutter_template/api/data/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo_item.g.dart';

/// {@template photo_item.class}
/// DTO for list item.
/// {@endtemplate}
@JsonSerializable(explicitToJson: true)
class PhotoItem {
  /// color
  final String color;
  /// hash for blur
  final String blur_hash;
  /// link to the photo
  final Urls urls;
  /// likes for photos
  final int likes;
  /// The user who posted the photo
  final User user;

  /// {@macro photo_item.class}
  const PhotoItem({
    required this.color,
    required this.blur_hash,
    required this.urls,
    required this.likes,
    required this.user,
  });

  /// Get DTO object from json.
  factory PhotoItem.fromJson(Map<String, dynamic> json) =>
      _$PhotoItemFromJson(json);

  /// Convert a DTO object to json.
  Map<String, dynamic> toJson() => _$PhotoItemToJson(this);
}

