import 'package:flutter_template/api/data/photo_item.dart';
import 'package:flutter_template/core/architecture/data/converter/converter.dart';
import 'package:flutter_template/features/photostock/domain/entities/photo_entity.dart';

/// Converter for [PhotoEntity].
typedef IPhotoConverter = Converter<PhotoEntity, List<PhotoItem>>;

/// {@template category_converter.class}
/// Implementation of [IPhotoConverter].
/// {@endtemplate}
final class PhotoConverter extends IPhotoConverter {
  /// {@macro category_converter.class}
  const PhotoConverter();

  @override
  PhotoEntity convert(List<PhotoItem> input) {
    return PhotoEntity(photos: input);
  }
}
