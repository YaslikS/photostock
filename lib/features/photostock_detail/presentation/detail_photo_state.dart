/// The state of detail photo screen.
sealed class DetailPhotoState {
  const DetailPhotoState();
}

/// {@template detail_photo_state_initial.class}
/// Initial state.
/// {@endtemplate}
class DetailPhotoStateInitial extends DetailPhotoState {
  /// {@macro detail_photo_state_initial.class}
  const DetailPhotoStateInitial();
}

/// {@template detail_photo_state_loading.class}
/// Loading some info.
/// {@endtemplate}
class DetailPhotoStateLoading extends DetailPhotoState {
  /// {@macro detail_photo_state_loading.class}
  const DetailPhotoStateLoading();
}

/// {@template detail_photo_state_loaded.class}
/// some info is loaded.
/// {@endtemplate}
class DetailPhotoStateLoaded extends DetailPhotoState {
  /// {@macro detail_photo_state_loaded.class}
  const DetailPhotoStateLoaded();
}

/// {@template detail_photo_state_error.class}
/// Error loading a some info.
/// {@endtemplate}
class DetailPhotoStateError extends DetailPhotoState {
  /// {@macro detail_photo_state_error.class}
  const DetailPhotoStateError();
}
