import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/api/data/photo_item.dart';
import 'package:flutter_template/features/common/utils/sizes/app_sizes.dart';
import 'package:flutter_template/features/photostock_list/presentation/new_list_state.dart';
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
    required this.scrollController,
    super.key,
  });

  /// controller controls the scroll of the list
  final ScrollController scrollController;

  /// observing status of uploading new photos
  final ValueListenable<NewListState> stateNewList;

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
              return PhotoListItemWidget(photoItem: widget.photosList[i]);
            },
          ),
        ),
        ValueListenableBuilder<NewListState>(
          valueListenable: widget.stateNewList,
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

  /// listener for a Scroll Controller
  void _scrollListener() {
    if (widget.scrollController.offset >=
            widget.scrollController.positions.last.maxScrollExtent &&
        !widget.scrollController.position.outOfRange) {
      widget.listNeedsUpdate();
    }
  }
}
