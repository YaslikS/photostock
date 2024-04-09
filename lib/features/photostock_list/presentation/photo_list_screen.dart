import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/photostock_list/presentation/photo_list_state.dart';
import 'package:flutter_template/features/photostock_list/presentation/photo_list_wm.dart';

/// {@template photo_list_screen.class}
/// PhotoListScreen.
/// {@endtemplate}
class PhotoListScreen extends ElementaryWidget<IPhotoListWM> {
  /// {@macro photo_list_screen.class}
  const PhotoListScreen({
    super.key,
    WidgetModelFactory wmFactory = defaultFeatureExampleWMFactory,
  }) : super(wmFactory);

  @override
  Widget build(IPhotoListWM wm) {
    const PhotoListStateInitial();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ValueListenableBuilder<PhotoListState>(
          valueListenable: wm.state,
          builder: (_, state, __) => switch (state) {
            PhotoListStateInitial _ => const SizedBox.shrink(),
            PhotoListStateLoading _ => const CircularProgressIndicator(),
            PhotoListStateLoaded(:final photoEntity) => Text(photoEntity.photos[0].user.username),
            PhotoListStateError _ => Text(wm.l10n.featureExampleFailedLoadIpMessage),
          },
        ),
      ),
    );
  }
}
