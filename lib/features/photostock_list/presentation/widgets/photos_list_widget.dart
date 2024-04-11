import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/api/data/photo_item.dart';
import 'package:flutter_template/features/common/utils/sizes/app_sizes.dart';
import 'package:flutter_template/features/photostock_list/presentation/widgets/photo_list_item_widget.dart';

/// {@template photos_list_widget.class}
/// PhotoListWidget.
/// {@endtemplate}
class PhotosListWidget extends StatelessWidget {
  /// {@macro photos_list_widget.class}
  const PhotosListWidget({
    required this.listNeedsUpdate,
    required this.photosList,
    super.key,
  });

  /// update list of photos
  final VoidCallback listNeedsUpdate;

  /// List of photos
  final List<PhotoItem> photosList;

  @override
  Widget build(BuildContext context) {
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
          const CupertinoSliverNavigationBar(
            backgroundColor: Colors.white,
            largeTitle: Text("Photos"),
            border: Border(
              bottom: BorderSide(
                color: CupertinoColors.white,
              ),
            ),
          ),
          SliverGrid.builder(
            itemCount: photosList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, i) {
              return PhotoListItemWidget(photoItem: photosList[i]);
            },
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(AppSizes.double20),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
