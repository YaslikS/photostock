import 'package:flutter_template/api/data/urls.dart';
import 'package:flutter_template/api/data/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo_item.g.dart';

@JsonSerializable(explicitToJson: true)
class PhotoItem {
  String color;
  String blur_hash;
  Urls urls;
  int likes;
  User user;

  PhotoItem({
    required this.color,
    required this.blur_hash,
    required this.urls,
    required this.likes,
    required this.user,
  });

  // From Json
  factory PhotoItem.fromJson(Map<String, dynamic> json) =>
      _$PhotoItemFromJson(json);

  // ToJson
  Map<String, dynamic> toJson() => _$PhotoItemToJson(this);
}

