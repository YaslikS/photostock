import 'package:flutter_template/core/architecture/domain/entity/request_operation.dart';
import 'package:flutter_template/features/photostock_list/data/repositories/photos_repository.dart';
import 'package:flutter_template/features/photostock_list/domain/entities/photo_entity.dart';

/// Interface for [PhotosRepository].
///
/// The repository is needed to demonstrate interaction with the api.
// ignore: one_member_abstracts
abstract interface class IPhotosRepository {
  /// Request to get the current list of photos.
  RequestOperation<PhotoEntity> getPhotos();
}
