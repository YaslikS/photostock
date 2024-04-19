import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/widgets/di_scope.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_names.dart';
import 'package:flutter_template/features/photostock_list/di/photo_list_scope.dart';
import 'package:flutter_template/features/photostock_list/presentation/photo_list_screen.dart';

/// {@template photo_list_flow.class}
/// Entry of photo list feature.
/// {@endtemplate}
@RoutePage(name: AppRouteNames.photoListScreen)
class PhotoListFlow extends StatelessWidget implements AutoRouteWrapper {
  /// {@macro debug_flow.class}
  const PhotoListFlow({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return DiScope<IPhotoListScope>(
      onFactory: PhotoListScope.create,
      onDispose: (scope) => scope.dispose(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PhotoListScreen();
  }
}
