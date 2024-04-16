import 'package:flutter_template/api/data/photo_item.dart';

/// The state of feature example screen.
sealed class ScreenListState {
  const ScreenListState();
}

/// {@template screen_list_state_loaded.class}
/// list of photos is loaded.
/// {@endtemplate}
class ScreenListStateAccumulation extends ScreenListState {
  /// object with list of photos.
  List<PhotoItem> photos;

  /// {@macro screen_list_state_accumulation.class}
  ScreenListStateAccumulation(this.photos);
}
