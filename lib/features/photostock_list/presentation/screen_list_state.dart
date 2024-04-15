import 'package:flutter_template/api/data/photo_item.dart';

/// The state of feature example screen.
sealed class ScreenListState {
  const ScreenListState();
}

/// {@template screen_list_state_initial.class}
/// Initial state.
/// {@endtemplate}
class ScreenListStateInitial extends ScreenListState {
  /// {@macro screen_list_state_initial.class}
  const ScreenListStateInitial();
}

/// {@template screen_list_state_loading.class}
/// Loading a list of photos.
/// {@endtemplate}
class ScreenListStateLoading extends ScreenListState {
  /// {@macro screen_list_state_loading.class}
  const ScreenListStateLoading();
}

/// {@template screen_list_state_loaded.class}
/// list of photos is loaded.
/// {@endtemplate}
class ScreenListStateLoaded extends ScreenListState {
  /// object with list of photos.
  List<PhotoItem> photos;

  /// {@macro screen_list_state_loaded.class}
  ScreenListStateLoaded(this.photos);
}

/// {@template screen_list_state_error.class}
/// Error loading a list of photos.
/// {@endtemplate}
class ScreenListStateError extends ScreenListState {
  /// {@macro screen_list_state_error.class}
  const ScreenListStateError();
}
