import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/api/data/photo_item.dart';
import 'package:flutter_template/features/common/utils/sizes/app_sizes.dart';
import 'package:flutter_template/features/photostock_list/presentation/new_list_state.dart';
import 'package:flutter_template/features/photostock_list/presentation/widgets/photo_list_item_widget.dart';

/// {@template photos_list_widget.class}
/// PhotoListWidget.
/// {@endtemplate}
class PhotosListWidget extends StatelessWidget {
  /// {@macro photos_list_widget.class}
  const PhotosListWidget({
    required this.stateNewList,
    required this.scrollController,
    required this.listNeedsUpdate,
    required this.photosList,
    super.key,
  });

  /// observing status of uploading new photos
  final ValueListenable<NewListState> stateNewList;

  /// Scroll Controller
  final ScrollController scrollController;

  /// update list of photos
  final VoidCallback listNeedsUpdate;

  /// List of photos
  final List<PhotoItem> photosList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            // controller: scrollController,
            padding: EdgeInsets.zero,
            itemCount: photosList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, i) {
              return PhotoListItemWidget(photoItem: photosList[i]);
            },
          ),
        ),
        ValueListenableBuilder<NewListState>(
          valueListenable: stateNewList,
          builder: (_, state, __) => switch (state) {
            NewListStateLoading _ => const Padding(
                padding: EdgeInsets.only(
                  bottom: AppSizes.double32,
                  top: AppSizes.double20,
                ),
                child: Center(
                  child: CupertinoActivityIndicator(),
                ),
              ),
            _ => const SizedBox.shrink(),
          },
        ),
      ],
    );
  }
}
