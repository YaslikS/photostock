import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/api/data/photo_item.dart';
import 'package:flutter_template/features/common/utils/sizes/app_constants.dart';
import 'package:flutter_template/features/common/utils/sizes/app_sizes.dart';
import 'package:flutter_template/features/photostock_list/presentation/photo_list_wm.dart';
import 'package:flutter_template/features/photostock_list/presentation/widgets/photo_list_item_widget.dart';
import 'package:flutter_template/l10n/app_localizations_x.dart';
import 'package:flutter_template/uikit/colors/app_color_scheme.dart';

/// {@template photos_list_widget.class}
/// PhotoListWidget.
/// {@endtemplate}
class PhotosListWidget extends StatelessWidget {
  /// {@macro photos_list_widget.class}
  const PhotosListWidget({
    required this.listNeedsUpdate,
    required this.photosList,
    required this.oldLastItem,
    super.key,
  });

  /// end of old list
  final int oldLastItem;

  /// update list of photos
  final VoidCallback listNeedsUpdate;

  /// List of photos
  final List<PhotoItem> photosList;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final l10n = context.l10n;
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollEndNotification &&
            notification.metrics.pixels == notification.metrics.maxScrollExtent) {
          listNeedsUpdate();
        }
        return false;
      },
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            backgroundColor: colorScheme.background,
            largeTitle: Text(l10n.photoListTitle),
            border: Border(
              bottom: BorderSide(
                color: colorScheme.background,
              ),
            ),
          ),
          SliverGrid.builder(
            itemCount: photosList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: AppConstants.int2,
            ),
            itemBuilder: (context, i) {
              return PhotoListItemWidget(photoItem: photosList[i]);
            },
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
