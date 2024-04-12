import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/api/data/photo_item.dart';
import 'package:flutter_template/features/common/utils/sizes/app_sizes.dart';
import 'package:flutter_template/features/photostock_list/presentation/widgets/photo_list_item_widget.dart';
import 'package:scrollview_observer/scrollview_observer.dart';

/// {@template photos_list_widget.class}
/// PhotoListWidget.
/// {@endtemplate}
class PhotosListWidget extends StatefulWidget {
  /// {@macro photos_list_widget.class}
  PhotosListWidget({
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
  State<PhotosListWidget> createState() => _PhotosListWidgetState();
}

class _PhotosListWidgetState extends State<PhotosListWidget> {

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollEndNotification &&
            notification.metrics.pixels == notification.metrics.maxScrollExtent) {
          widget.listNeedsUpdate();
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
            itemCount: widget.photosList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, i) {
              return PhotoListItemWidget(photoItem: widget.photosList[i]);
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
