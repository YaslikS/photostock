// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DebugRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const DebugFlow()),
      );
    },
    PhotoDetailRouter.name: (routeData) {
      final args = routeData.argsAs<PhotoDetailRouterArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailPhotoScreen(
          photoItem: args.photoItem,
          key: args.key,
        ),
      );
    },
    FeatureExampleRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const FeatureExampleFlow()),
      );
    },
    PhotoListRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const PhotoListFlow()),
      );
    },
    UiKitRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UiKitFlow(),
      );
    },
  };
}

/// generated route for
/// [DebugFlow]
class DebugRouter extends PageRouteInfo<void> {
  const DebugRouter({List<PageRouteInfo>? children})
      : super(
          DebugRouter.name,
          initialChildren: children,
        );

  static const String name = 'DebugRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DetailPhotoScreen]
class PhotoDetailRouter extends PageRouteInfo<PhotoDetailRouterArgs> {
  PhotoDetailRouter({
    required PhotoItem photoItem,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          PhotoDetailRouter.name,
          args: PhotoDetailRouterArgs(
            photoItem: photoItem,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PhotoDetailRouter';

  static const PageInfo<PhotoDetailRouterArgs> page =
      PageInfo<PhotoDetailRouterArgs>(name);
}

class PhotoDetailRouterArgs {
  const PhotoDetailRouterArgs({
    required this.photoItem,
    this.key,
  });

  final PhotoItem photoItem;

  final Key? key;

  @override
  String toString() {
    return 'PhotoDetailRouterArgs{photoItem: $photoItem, key: $key}';
  }
}

/// generated route for
/// [FeatureExampleFlow]
class FeatureExampleRoute extends PageRouteInfo<void> {
  const FeatureExampleRoute({List<PageRouteInfo>? children})
      : super(
          FeatureExampleRoute.name,
          initialChildren: children,
        );

  static const String name = 'FeatureExampleRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PhotoListFlow]
class PhotoListRouter extends PageRouteInfo<void> {
  const PhotoListRouter({List<PageRouteInfo>? children})
      : super(
          PhotoListRouter.name,
          initialChildren: children,
        );

  static const String name = 'PhotoListRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UiKitFlow]
class UiKitRouter extends PageRouteInfo<void> {
  const UiKitRouter({List<PageRouteInfo>? children})
      : super(
          UiKitRouter.name,
          initialChildren: children,
        );

  static const String name = 'UiKitRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}
