import 'package:dio/dio.dart';
import 'package:flutter_template/api/service/photo/photo_api.dart';
import 'package:flutter_template/core/architecture/domain/entity/failure.dart';
import 'package:flutter_template/core/architecture/domain/entity/request_operation.dart';
import 'package:flutter_template/core/architecture/domain/entity/result.dart';
import 'package:flutter_template/features/photostock_list/data/converters/photo_converter.dart';
import 'package:flutter_template/features/photostock_list/domain/entities/photo_entity.dart';
import 'package:flutter_template/features/photostock_list/domain/repositories/i_photos_repository.dart';

/// {@template photos_repository.class}
/// Implementation of [IPhotosRepository].
/// {@endtemplate}
final class PhotosRepository implements IPhotosRepository {
  final PhotoApi _photoApi;
  final IPhotoConverter _photoConverter;

  /// {@macro photos_repository.class}
  const PhotosRepository({
    required PhotoApi photoApi,
    required IPhotoConverter photoConverter,
  })  : _photoApi = photoApi,
        _photoConverter = photoConverter;

  @override
  RequestOperation<PhotoEntity> getPhotos() async {
    try {
      final result = await _photoApi.getPhoto();

      return Result.ok(_photoConverter.convert(result));
    } on DioException catch (error, s) {
      return Result.failed(Failure(original: error, trace: s));
      // ignore: avoid-identical-exception-handling-blocks
    } on Object catch (error, s) {
      return Result.failed(Failure(original: error, trace: s));
    }
  }
}
