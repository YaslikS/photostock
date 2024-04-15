import 'package:flutter_template/features/photostock_list/domain/entities/photo_entity.dart';

/// The state of feature example screen.
sealed class PhotoListState {
  const PhotoListState();
}

/// {@template photo_list_state_initial.class}
/// Initial state.
/// {@endtemplate}
class PhotoListStateInitial extends PhotoListState {
  /// {@macro photo_list_state_initial.class}
  const PhotoListStateInitial();
}

/// {@template photo_list_state_loading.class}
/// Loading a list of photos.
/// {@endtemplate}
class PhotoListStateLoading extends PhotoListState {
  /// {@macro photo_list_state_loading.class}
  const PhotoListStateLoading();
}

/// {@template photo_list_state_loaded.class}
/// list of photos is loaded.
/// {@endtemplate}
class PhotoListStateLoaded extends PhotoListState {
  /// object with list of photos.
  final PhotoEntity photoEntity;

  /// {@macro photo_list_state_loaded.class}
  PhotoListStateLoaded(PhotoEntity newPhotoEntity) : photoEntity = newPhotoEntity {
    photoEntity.photos.addAll(newPhotoEntity.photos);
  }
  // const PhotoListStateLoaded(this.photoEntity);
}

/// {@template photo_list_state_error.class}
/// Error loading a list of photos.
/// {@endtemplate}
class PhotoListStateError extends PhotoListState {
  /// {@macro photo_list_state_error.class}
  const PhotoListStateError();
}
