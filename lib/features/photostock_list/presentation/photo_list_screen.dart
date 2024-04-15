import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/common/utils/sizes/app_sizes.dart';
import 'package:flutter_template/features/photostock_list/presentation/screen_list_state.dart';
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
    const ScreenListStateInitial();

    return CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            CupertinoSliverNavigationBar(
              backgroundColor: wm.colorScheme.background,
              largeTitle: Text(wm.l10n.photoListTitle),
              border: Border(
                bottom: BorderSide(
                  color: wm.colorScheme.background,
                ),
              ),
            )
          ];
        },
        body: ValueListenableBuilder<ScreenListState>(
          valueListenable: wm.state,
          builder: (_, state, __) => switch (state) {
            ScreenListStateInitial _ => const Center(
              child: SizedBox.shrink(),
            ),
            ScreenListStateLoading _ => const Center(
              child: CupertinoActivityIndicator(),
            ),
            ScreenListStateLoaded(:final photos) => PhotosListWidget(
              photosList: photos,
              listNeedsUpdate: wm.listNeedsUpdate,
            ),
            ScreenListStateError _ => Center(
              child: Text(
                wm.l10n.photoListFailedLoadListPhotoMessage,
              ),
            ),
          },
        ),
      ),
    );
  }
}

