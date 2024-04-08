import 'package:flutter_template/api/data/photo_item.dart';
import 'package:flutter_template/core/architecture/domain/entity/request_operation.dart';
import 'package:flutter_template/features/feature_example/data/repositories/feature_example_repository.dart';
import 'package:flutter_template/features/photostock/domain/entities/photo_entity.dart';

/// Interface for [FeatureExampleRepository].
///
/// The repository is needed to demonstrate interaction with the api.
// ignore: one_member_abstracts
abstract interface class IPhotosRepository {
  /// Request to get the current IP address.
  RequestOperation<PhotoEntity> getPhotos();
}
