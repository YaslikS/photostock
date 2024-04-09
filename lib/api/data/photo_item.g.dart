// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoItem _$PhotoItemFromJson(Map<String, dynamic> json) => PhotoItem(
      color: json['color'] as String,
      blur_hash: json['blur_hash'] as String,
      urls: Urls.fromJson(json['urls'] as Map<String, dynamic>),
      likes: json['likes'] as int,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PhotoItemToJson(PhotoItem instance) => <String, dynamic>{
      'color': instance.color,
      'blur_hash': instance.blur_hash,
      'urls': instance.urls.toJson(),
      'likes': instance.likes,
      'user': instance.user.toJson(),
    };
