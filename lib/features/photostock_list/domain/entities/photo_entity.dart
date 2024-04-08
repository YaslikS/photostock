import 'package:flutter_template/api/data/photo_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_entity.freezed.dart';

/// {@template photo_entity.class}
/// Object of the list of items in the list of photos.
/// {@endtemplate}
@freezed
class PhotoEntity with _$PhotoEntity {
  /// {@macro photo_entity.class}
  const factory PhotoEntity({
    /// list of photos.
    required List<PhotoItem> photos,
  }) = _PhotoEntity;
}
