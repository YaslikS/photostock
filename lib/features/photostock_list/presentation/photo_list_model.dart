import 'package:flutter/foundation.dart';
import 'package:flutter_template/common/utils/extentions/value_notifier_x.dart';
import 'package:flutter_template/core/architecture/domain/entity/result.dart';
import 'package:flutter_template/core/architecture/presentation/base_model.dart';
import 'package:flutter_template/features/navigation/service/app_router.dart';
import 'package:flutter_template/features/photostock_list/domain/repositories/i_photos_repository.dart';
import 'package:flutter_template/features/photostock_list/presentation/photo_list_screen.dart';
import 'package:flutter_template/features/photostock_list/presentation/photo_list_state.dart';

/// {@template photo_list_model.class}
/// [PhotoListModel] for [PhotoListScreen].
/// {@endtemplate}
final class PhotoListModel extends BaseModel {
  final IPhotosRepository _repository;

  final _state = ValueNotifier<PhotoListState>(const PhotoListStateInitial());

  /// State of screen.
  ValueListenable<PhotoListState> get state => _state;

  /// {@macro photo_list_model.class}
  PhotoListModel({
    required IPhotosRepository repository,
    required super.logWriter,
  }) : _repository = repository;

  @override
  void dispose() {
    _state.dispose();
    super.dispose();
  }

  /// Load list of photos.
  Future<void> loadPhotos() async {
    _state.emit(const PhotoListStateLoading());

    final result = await makeCall(_repository.getPhotos);

    switch (result) {
      case ResultOk(:final data):
        _state.emit(PhotoListStateLoaded(data));
      case ResultFailed():
        _state.emit(const PhotoListStateError());
    }
  }
}
