import 'package:flutter_template/api/data/photo_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_entity.freezed.dart';

/// {@template ip_entity.class}
/// IP address.
/// {@endtemplate}
@freezed
class PhotoEntity with _$PhotoEntity {
  /// {@macro ip_entity.class}
  const factory PhotoEntity({
    /// IP address.
    required List<PhotoItem> photos,
  }) = _PhotoEntity;
}
