import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/api/data/photo_item.dart';
import 'package:flutter_template/features/debug/presentation/debug/debug_flow.dart';
import 'package:flutter_template/features/debug/presentation/ui_kit/ui_kit_flow.dart';
import 'package:flutter_template/features/feature_example/presentation/feature_example_flow.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_paths.dart';
import 'package:flutter_template/features/photostock_detail/presentation/detail_photo_screen.dart';
import 'package:flutter_template/features/photostock_list/presentation/photo_list_flow.dart';

part 'app_router.gr.dart';

/// {@template router.class}
/// Main point of the application navigation.
/// {@endtemplate}
@AutoRouterConfig(
  replaceInRouteName: 'Flow,Route',
)
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: PhotoListRouter.page,
          path: AppRoutePaths.photoListPath,
          initial: true,
        ),
        AutoRoute(
          page: PhotoDetailRouter.page,
          path: AppRoutePaths.detailPhotoPath,
        ),
        AutoRoute(
          page: DebugRouter.page,
          path: AppRoutePaths.debugPath,
        ),
        AutoRoute(
          page: UiKitRouter.page,
          path: AppRoutePaths.uiKitPath,
        ),
        AutoRoute(
          page: FeatureExampleRoute.page,
          path: AppRoutePaths.featureExample,
        ),
      ];
}
