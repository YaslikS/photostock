import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_template/api/data/photo_item.dart';
import 'package:flutter_template/features/common/utils/sizes/app_sizes.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_names.dart';

/// {@template detail_photo_screen.class}
/// PhotoListScreen.
/// {@endtemplate}
@RoutePage(name: AppRouteNames.photoDetailScreen)
class DetailPhotoScreen extends StatelessWidget {
  /// {@macro detail_photo_screen.class}
  const DetailPhotoScreen({
    required this.photoItem,
    super.key,
  });

  /// one item in List of photos
  final PhotoItem photoItem;

  @override
  Widget build(BuildContext context) {
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
              height: AppSizes.double400,
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
                  style: const TextStyle(
                    fontSize: AppSizes.double32,
                  ),
                ),
                Text(
                  '${photoItem.likes} likes',
                  style: const TextStyle(
                    fontSize: AppSizes.double20,
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
