/// The state of uploaded list of photos.
sealed class UploadedListState {
  const UploadedListState();
}

/// {@template new_list_state_initial.class}
/// Initial state.
/// {@endtemplate}
class UploadedListStateInitial extends UploadedListState {
  /// {@macro new_list_state_initial.class}
  const UploadedListStateInitial();
}

/// {@template new_list_state_loading.class}
/// Loading list of photos.
/// {@endtemplate}
class UploadedListStateLoading extends UploadedListState {
  /// {@macro new_list_state_loading.class}
  const UploadedListStateLoading();
}

/// {@template new_list_state_loaded.class}
/// list of photos is loaded.
/// {@endtemplate}
class UploadedListStateLoaded extends UploadedListState {
  /// {@macro new_list_state_loaded.class}
  const UploadedListStateLoaded();
}

/// {@template new_list_state_error.class}
/// Error loading list of photos.
/// {@endtemplate}
class UploadedListStateError extends UploadedListState {
  /// {@macro new_list_state_error.class}
  const UploadedListStateError();
}
