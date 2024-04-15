import 'package:flutter/foundation.dart';
import 'package:flutter_template/common/utils/extentions/value_notifier_x.dart';
import 'package:flutter_template/core/architecture/domain/entity/result.dart';
import 'package:flutter_template/core/architecture/presentation/base_model.dart';
import 'package:flutter_template/features/photostock_list/domain/repositories/i_photos_repository.dart';
import 'package:flutter_template/features/photostock_list/presentation/photo_list_screen.dart';
import 'package:flutter_template/features/photostock_list/presentation/new_list_state.dart';
import 'package:flutter_template/features/photostock_list/presentation/screen_list_state.dart';

/// {@template photo_list_model.class}
/// [PhotoListModel] for [PhotoListScreen].
/// {@endtemplate}
final class PhotoListModel extends BaseModel {
  final IPhotosRepository _repository;

  final _state = ValueNotifier<ScreenListState>(
    ScreenListStateLoaded([]),
  );
  final _stateNewList = ValueNotifier<NewListState>(
    const NewListStateInitial(),
  );

  /// State of screen.
  ValueListenable<ScreenListState> get state => _state;

  /// State of new photos.
  ValueListenable<NewListState> get stateNewList => _stateNewList;

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
  Future<void> loadPhotos(int page) async {
    _stateNewList.emit(const NewListStateLoading());

    final result = await makeCall(() => _repository.getPhotos(page));

    switch (result) {
      case ResultOk(:final data):
        final currentPhoto1 = (_state.value as ScreenListStateLoaded).photos;
        currentPhoto1.addAll(data.photos);

        _state.emit(ScreenListStateLoaded(currentPhoto1));
        _stateNewList.emit(NewListStateLoaded(data));
      case ResultFailed():
        _stateNewList.emit(const NewListStateError());
    }
  }
}
