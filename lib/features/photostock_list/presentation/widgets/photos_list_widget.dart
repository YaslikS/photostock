import 'package:flutter/cupertino.dart';
import 'package:flutter_template/api/data/photo_item.dart';
import 'package:flutter_template/features/common/utils/sizes/app_sizes.dart';
import 'package:flutter_template/features/photostock_list/presentation/new_list_state.dart';
import 'package:flutter_template/features/photostock_list/presentation/photo_list_wm.dart';
import 'package:flutter_template/features/photostock_list/presentation/widgets/photo_list_item_widget.dart';

/// {@template photos_list_widget.class}
/// PhotoListWidget.
/// {@endtemplate}
class PhotosListWidget extends StatefulWidget {
  /// {@macro photos_list_widget.class}
  const PhotosListWidget({
    required this.wm,
    required this.photosList,
    super.key,
  });

  /// widgetModel for observing the stateNewList
  final IPhotoListWM wm;

  /// List of photos
  final List<PhotoItem> photosList;

  @override
  State<PhotosListWidget> createState() => _PhotosListWidgetState();
}

class _PhotosListWidgetState extends State<PhotosListWidget> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            controller: _controller,
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
          valueListenable: widget.wm.stateNewList,
          builder: (_, state, __) => switch (state) {
            NewListStateInitial _ => Container(),
            NewListStateLoading _ => const Padding(
                padding: EdgeInsets.only(
                  bottom: AppSizes.double32,
                  top: AppSizes.double20,
                ),
                child: Center(
                  child: CupertinoActivityIndicator(),
                ),
              ),
            NewListStateLoaded _ => Container(),
            NewListStateError _ => Container(),
          },
        ),
      ],
    );
  }

  void _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      widget.wm.listNeedsUpdate();
    }
  }
}
