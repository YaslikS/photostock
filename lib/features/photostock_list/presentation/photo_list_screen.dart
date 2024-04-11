import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/photostock_list/presentation/photo_list_state.dart';
import 'package:flutter_template/features/photostock_list/presentation/photo_list_wm.dart';
import 'package:flutter_template/features/photostock_list/presentation/widgets/photos_list_widget.dart';

/// {@template photo_list_screen.class}
/// PhotoListScreen.
/// {@endtemplate}
class PhotoListScreen extends ElementaryWidget<IPhotoListWM> {
  /// {@macro photo_list_screen.class}
  const PhotoListScreen({
    super.key,
    WidgetModelFactory wmFactory = photoListWMFactory,
  }) : super(wmFactory);

  @override
  Widget build(IPhotoListWM wm) {
    const PhotoListStateInitial();

    return Scaffold(
      body: ValueListenableBuilder<PhotoListState>(
        valueListenable: wm.state,
        builder: (_, state, __) => switch (state) {
          PhotoListStateInitial _ => const Center(
              child: SizedBox.shrink(),
            ),
          PhotoListStateLoading _ => const Center(
              child: CircularProgressIndicator(),
            ),
          PhotoListStateLoaded(:final photoEntity) => PhotosListWidget(
              listNeedsUpdate: wm.listNeedsUpdate,
              photosList: photoEntity.photos,
            ),
          PhotoListStateError _ => Text(
              wm.l10n.featureExampleFailedLoadIpMessage,
            ),
        },
      ),
    );
  }
}
