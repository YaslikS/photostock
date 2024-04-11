import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/api/data/photo_item.dart';
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

  /// TODO: ОПИСАНИЕ
  final VoidCallback listNeedsUpdate;

  /// List of photos
  final List<PhotoItem> photosList;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollEndNotification &&
            notification.metrics.pixels == notification.metrics.maxScrollExtent) {
          // _data.addAll(List.generate(10, (index) => _data.length + index));
          if (kDebugMode) {
            print("listNeedsUpdate");
          }
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
            itemCount: photosList.length + 1,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, i) {
              if (i < photosList.length) {
                return PhotoListItemWidget(photoItem: photosList[i]);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
