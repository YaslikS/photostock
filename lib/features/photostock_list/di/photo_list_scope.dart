import 'package:flutter/material.dart';
import 'package:flutter_template/api/service/ip/ip_api.dart';
import 'package:flutter_template/api/service/photo/photo_api.dart';
import 'package:flutter_template/common/utils/disposable_object/disposable_object.dart';
import 'package:flutter_template/common/utils/disposable_object/i_disposable_object.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/feature_example/data/converters/ip_converter.dart';
import 'package:flutter_template/features/feature_example/data/repositories/feature_example_repository.dart';
import 'package:flutter_template/features/feature_example/domain/repositories/i_feature_example_repository.dart';
import 'package:flutter_template/features/photostock_list/data/converters/photo_converter.dart';
import 'package:flutter_template/features/photostock_list/data/repositories/photos_repository.dart';
import 'package:flutter_template/features/photostock_list/domain/repositories/i_photos_repository.dart';
import 'package:provider/provider.dart';

/// {@template photo_list_scope.class}
/// Implementation of [IPhotoListScope].
/// {@endtemplate}
final class PhotoListScope extends DisposableObject implements IPhotoListScope {
  @override
  final IPhotosRepository repository;

  /// Factory constructor for [IPhotoListScope].
  factory PhotoListScope.create(BuildContext context) {
    final appScope = context.read<IAppScope>();
    const photoUrl = 'https://api.unsplash.com/photos/?client_id=';
    const accessKey =
        '896d4f52c589547b2134bd75ed48742db637fa51810b49b607e37e46ab2c0043';

    return PhotoListScope(
      PhotosRepository(
        photoApi: PhotoApi(appScope.dio, baseUrl: photoUrl+accessKey),
        photoConverter: const PhotoConverter(),
      ),
    );
  }

  /// {@macro photo_list_scope.class}
  PhotoListScope(this.repository);
}

/// Scope dependencies of the Photostock List feature.
abstract interface class IPhotoListScope implements IDisposableObject {
  /// PhotosRepository.
  IPhotosRepository get repository;
}
