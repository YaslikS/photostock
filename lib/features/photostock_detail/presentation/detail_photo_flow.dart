import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/api/data/photo_item.dart';
import 'package:flutter_template/common/widgets/di_scope.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_names.dart';
import 'package:flutter_template/features/photostock_detail/di/detail_photo_scope.dart';
import 'package:flutter_template/features/photostock_detail/presentation/detail_photo_screen.dart';

/// {@template detail_photo_flow.class}
/// Entry of detail photo feature.
/// {@endtemplate}
@RoutePage(name: AppRouteNames.photoDetailScreen)
class DetailPhotoFlow extends StatelessWidget implements AutoRouteWrapper {
  /// {@macro detail_photo_flow.class}
  const DetailPhotoFlow({
    required this.photoItem,
    super.key,
  });

  /// one item in List of photos
  final PhotoItem photoItem;

  @override
  Widget wrappedRoute(BuildContext context) {
    return DiScope<IDetailPhotoScope>(
      onFactory: DetailPhotoScope.create,
      onDispose: (scope) => scope.dispose(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DetailPhotoScreen(photoItem: photoItem);
  }
}
