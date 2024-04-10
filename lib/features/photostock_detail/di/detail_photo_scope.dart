import 'package:flutter/material.dart';
import 'package:flutter_template/common/utils/disposable_object/disposable_object.dart';
import 'package:flutter_template/common/utils/disposable_object/i_disposable_object.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:provider/provider.dart';

/// {@template detail_photo_scope.class}
/// Implementation of [IDetailPhotoScope].
/// {@endtemplate}
final class DetailPhotoScope extends DisposableObject implements IDetailPhotoScope {
  @override
  // final IPhotosRepository repository;

  /// Factory constructor for [IDetailPhotoScope].
  factory DetailPhotoScope.create(BuildContext context) {
    final appScope = context.read<IAppScope>();
    // final photoUrl = appScope.appConfig.url.value;
    // final accessKey = appScope.appConfig.accessKey;

    return DetailPhotoScope(
      // PhotosRepository(
      //   photoApi: PhotoApi(appScope.dio, baseUrl: photoUrl + accessKey),  // TODO: YaslikS - remove accessKey from url
      //   photoConverter: const PhotoConverter(),
      // ),
    );
  }

  /// {@macro detail_photo_scope.class}
  DetailPhotoScope();
}

/// Scope dependencies of the Photostock Detail feature.
abstract interface class IDetailPhotoScope implements IDisposableObject {
  /// PhotosRepository.
  // IPhotosRepository get repository;
}
