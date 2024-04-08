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
  final String photoEntity;  //  TODO: change type to PhotoEntity after merge with SI-8578

  /// {@macro photo_list_state_loaded.class}
  const PhotoListStateLoaded(this.photoEntity);
}

/// {@template photo_list_state_error.class}
/// Error loading a list of photos.
/// {@endtemplate}
class PhotoListStateError extends PhotoListState {
  /// {@macro photo_list_state_error.class}
  const PhotoListStateError();
}
