import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/api/data/photo_item.dart';
import 'package:flutter_template/features/common/utils/sizes/app_sizes.dart';
import 'package:flutter_template/features/photostock_list/presentation/uploaded_list_state.dart';
import 'package:flutter_template/features/photostock_list/presentation/widgets/photo_list_item_widget.dart';

/// {@template photos_list_widget.class}
/// PhotoListWidget.
/// {@endtemplate}
class PhotosListWidget extends StatefulWidget {
  /// {@macro photos_list_widget.class}
  const PhotosListWidget({
    required this.stateNewList,
    required this.listNeedsUpdate,
    required this.photosList,
    required this.openDetailPhotoScreen,
    required this.scrollController,
    super.key,
  });

  /// func that opens the details screen
  final ValueChanged<PhotoItem> openDetailPhotoScreen;

  /// controller controls the scroll of the list
  final ScrollController scrollController;

  /// observing status of uploading new photos
  final ValueListenable<UploadedListState> stateNewList;

  /// update list of photos
  final VoidCallback listNeedsUpdate;

  /// List of photos
  final List<PhotoItem> photosList;

  @override
  State<PhotosListWidget> createState() => _PhotosListWidgetState();
}

class _PhotosListWidgetState extends State<PhotosListWidget> {
  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.zero,
            itemCount: widget.photosList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, i) {
              return PhotoListItemWidget(
                photoItem: widget.photosList[i],
                openDetailPhotoScreen: widget.openDetailPhotoScreen,
              );
            },
          ),
        ),
        ValueListenableBuilder<UploadedListState>(
          valueListenable: widget.stateNewList,
          builder: (_, state, __) => switch (state) {
            UploadedListStateLoading _ => const Padding(
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

  /// listener for a Scroll Controller
  void _scrollListener() {
    final currentScrollOffset = widget.scrollController.offset;
    final maxRangeScrollController =
        widget.scrollController.positions.last.maxScrollExtent;
    final positionOutOfRange = widget.scrollController.position.outOfRange;
    if (currentScrollOffset >= maxRangeScrollController && !positionOutOfRange) {
      widget.listNeedsUpdate();
    }
  }
}
