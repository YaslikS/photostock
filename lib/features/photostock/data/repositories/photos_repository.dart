import 'package:dio/dio.dart';
import 'package:flutter_template/api/service/photo/photo_api.dart';
import 'package:flutter_template/core/architecture/domain/entity/failure.dart';
import 'package:flutter_template/core/architecture/domain/entity/request_operation.dart';
import 'package:flutter_template/core/architecture/domain/entity/result.dart';
import 'package:flutter_template/features/photostock/data/converters/photo_converter.dart';
import 'package:flutter_template/features/photostock/domain/entities/photo_entity.dart';
import 'package:flutter_template/features/photostock/domain/repositories/i_photos_repository.dart';

// / {@template feature_example_repository.class}
// / Implementation of [IFeatureExampleRepository].
// / {@endtemplate}
final class PhotosRepository implements IPhotosRepository {
  final PhotoApi _photoApi;
  final IPhotoConverter _photoConverter;

  /// {@macro feature_example_repository.class}
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
