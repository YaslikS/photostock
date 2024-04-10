import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_template/api/data/photo_item.dart';
import 'package:flutter_template/features/common/utils/sizes/app_sizes.dart';
import 'package:flutter_template/features/photostock_detail/presentation/detail_photo_wm.dart';

/// {@template detail_photo_screen.class}
/// PhotoListScreen.
/// {@endtemplate}
class DetailPhotoScreen extends ElementaryWidget<IDetailPhotoWM> {
  /// {@macro detail_photo_screen.class}
  const DetailPhotoScreen({
    required this.photoItem,
    super.key,
    WidgetModelFactory wmFactory = defaultDetailPhotoWMFactory,
  }) : super(wmFactory);

  /// one item in List of photos
  final PhotoItem photoItem;

  @override
  Widget build(IDetailPhotoWM wm) {
    // const DetailPhotoStateInitial();
    // final theme = Theme.of(wm.);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.double20),
            child: SizedBox(
              height: 300,
              child: Image.network(
                photoItem.urls.regular,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: BlurHash(hash: photoItem.blur_hash),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSizes.double20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  photoItem.user.username,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Text(
                  '${photoItem.likes} likes',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}