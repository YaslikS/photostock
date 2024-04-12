import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_template/api/data/photo_item.dart';
import 'package:flutter_template/common/utils/extentions/hex_color_to_color.dart';
import 'package:flutter_template/features/common/utils/sizes/app_sizes.dart';
import 'package:flutter_template/uikit/colors/app_color_scheme.dart';

/// {@template photos_list_widget.class}
/// ItemListWidget.
/// Widget for one item in List of photos
/// {@endtemplate}
class PhotoListItemWidget extends StatelessWidget {
  /// {@macro photos_list_widget.class}
  const PhotoListItemWidget({
    required this.photoItem,
    super.key,
  });

  /// one item in List of photos
  final PhotoItem photoItem;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final theme = Theme.of(context);
    return GridTile(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.double12),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: colorScheme.background,
            borderRadius: BorderRadius.circular(AppSizes.double20),
            boxShadow: [
              BoxShadow(
                color: HexColor.fromHex(photoItem.color),
                blurRadius: 5,
              ),
            ],
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.double16),
                child: Image.network(
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  photoItem.urls.regular,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: BlurHash(hash: photoItem.blur_hash),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: AppSizes.double12,
                left: AppSizes.double12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      photoItem.user.username,
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: colorScheme.background,
                      ),
                    ),
                    Text(
                      '${photoItem.likes} likes',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: colorScheme.background,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
