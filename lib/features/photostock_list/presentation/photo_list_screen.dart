import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_template/features/photostock_list/presentation/photo_list_wm.dart';
import 'package:flutter_template/features/photostock_list/presentation/screen_list_state.dart';
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
          valueListenable: wm.screenState,
          builder: (_, state, __) => switch (state) {
            ScreenListStateAccumulation(:final photos) => PhotosListWidget(
                stateNewList: wm.stateNewList,
                scrollController: wm.scrollController,
                listNeedsUpdate: wm.listNeedsUpdate,
                photosList: photos,
              ),
          },
        ),
      ),
    );
  }
}
