import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/common/utils/sizes/app_sizes.dart';
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
      backgroundColor: wm.colorScheme.background,
      body: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            backgroundColor: wm.colorScheme.background,
            largeTitle: Text(wm.l10n.photoListTitle),
            border: Border(
              bottom: BorderSide(
                color: wm.colorScheme.background,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ValueListenableBuilder<PhotoListState>(
              valueListenable: wm.state,
              builder: (_, state, __) => switch (state) {
                PhotoListStateInitial _ => const Center(
                    child: SizedBox.shrink(),
                  ),
                PhotoListStateLoading _ => const Center(
                    child: CupertinoActivityIndicator(),
                  ),
                PhotoListStateLoaded(:final photoEntity) => PhotosListWidget(
                    photosList: photoEntity.photos,
                    listNeedsUpdate: wm.listNeedsUpdate,
                  ),
                PhotoListStateError _ => Center(
                    child: Text(
                      wm.l10n.photoListFailedLoadListPhotoMessage,
                    ),
                  ),
              },
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: AppSizes.double32,
                top: AppSizes.double20,
              ),
              child: Center(
                child: CupertinoActivityIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
