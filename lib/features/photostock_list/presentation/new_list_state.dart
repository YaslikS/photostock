/// The state of feature example screen.
sealed class NewListState {
  const NewListState();
}

/// {@template new_list_state_initial.class}
/// Initial state.
/// {@endtemplate}
class NewListStateInitial extends NewListState {
  /// {@macro new_list_state_initial.class}
  const NewListStateInitial();
}

/// {@template new_list_state_loading.class}
/// Loading a list of photos.
/// {@endtemplate}
class NewListStateLoading extends NewListState {
  /// {@macro new_list_state_loading.class}
  const NewListStateLoading();
}

/// {@template new_list_state_loaded.class}
/// list of photos is loaded.
/// {@endtemplate}
class NewListStateLoaded extends NewListState {
  /// {@macro new_list_state_loaded.class}
  const NewListStateLoaded();
}

/// {@template new_list_state_error.class}
/// Error loading a list of photos.
/// {@endtemplate}
class NewListStateError extends NewListState {
  /// {@macro new_list_state_error.class}
  const NewListStateError();
}
