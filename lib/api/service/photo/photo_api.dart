import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_template/api/data/photo_item.dart';
import 'package:retrofit/retrofit.dart';

part 'photo_api.g.dart';

/// API for photo API Unsplash.
@RestApi()
abstract class PhotoApi {
  /// API creation factory using [Dio].
  factory PhotoApi(Dio dio, {String baseUrl}) = _PhotoApi;

  /// Request to get the current list of photos
  @GET('')
  Future<List<PhotoItem>> getPhoto([
    @Query('page') int page = 1,
    @Query('format') String format = 'json',
  ]);
}
