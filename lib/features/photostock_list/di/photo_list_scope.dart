import 'package:flutter/material.dart';
import 'package:flutter_template/api/service/photo/photo_api.dart';
import 'package:flutter_template/common/utils/disposable_object/disposable_object.dart';
import 'package:flutter_template/common/utils/disposable_object/i_disposable_object.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
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
    final photoUrl = appScope.appConfig.url.value;
    final accessKey = appScope.appConfig.accessKey;

    return PhotoListScope(
      PhotosRepository(
        photoApi: PhotoApi(appScope.dio, baseUrl: photoUrl + accessKey),
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
