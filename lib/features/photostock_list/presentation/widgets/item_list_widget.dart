import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/api/data/photo_item.dart';
import 'package:flutter_template/common/utils/extentions/hex_color_to_color.dart';
import 'package:flutter_template/features/common/utils/sizes/app_sizes.dart';

/// {@template photos_list_widget.class}
/// ItemListWidget.
/// Widget for one item in List of photos
/// {@endtemplate}
class ItemListWidget extends StatelessWidget {
  /// {@macro photos_list_widget.class}
  const ItemListWidget({
    required this.photoItem, super.key,
  });

  /// one item in List of photos
  final PhotoItem photoItem;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GridTile(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.double12),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.teal,
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(AppSizes.double16)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(photoItem.urls.regular),
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppSizes.double12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Text(
                      photoItem.user.username,
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '${photoItem.likes} likes',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: Colors.white,
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
