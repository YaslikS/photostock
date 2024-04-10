import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/api/data/photo_item.dart';
import 'package:flutter_template/common/mixin/localization_mixin.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/common/utils/mixin/theme_wm_mixin.dart';
import 'package:flutter_template/features/navigation/service/app_router.dart';
import 'package:flutter_template/features/photostock_list/di/photo_list_scope.dart';
import 'package:flutter_template/features/photostock_list/presentation/photo_list_model.dart';
import 'package:flutter_template/features/photostock_list/presentation/photo_list_screen.dart';
import 'package:flutter_template/features/photostock_list/presentation/photo_list_state.dart';
import 'package:provider/provider.dart';

/// DI factory for [PhotoListWM].
PhotoListWM defaultFeatureExampleWMFactory(BuildContext context) {
  final appScope = context.read<IAppScope>();
  final scope = context.read<IPhotoListScope>();
  final appRouter = context.read<AppRouter>();

  return PhotoListWM(
    PhotoListModel(
      repository: scope.repository,
      logWriter: appScope.logger,
    ),
    router: appRouter,
  );
}

/// Interface for [PhotoListWM].
abstract interface class IPhotoListWM
    with ThemeIModelMixin, ILocalizationMixin
    implements IWidgetModel {

  /// State of screen.
  ValueListenable<PhotoListState> get state;

  /// Navigate to detail photo screen.
  void openDetailPhotoScreen(PhotoItem photoItem);
}

/// {@template photo_list_wm.class}
/// [WidgetModel] for [PhotoListScreen].
/// {@endtemplate}
final class PhotoListWM extends WidgetModel<PhotoListScreen, PhotoListModel>
    with ThemeWMMixin, LocalizationMixin
    implements IPhotoListWM {
  final AppRouter _router;

  @override
  ValueListenable<PhotoListState> get state => model.state;

  /// {@macro photo_list_wm.class}
  PhotoListWM(super._model, {
    required AppRouter router,
  })  : _router = router;

  @override
  void initWidgetModel() {
    model.loadPhotos();
    super.initWidgetModel();
  }

  @override
  void openDetailPhotoScreen(PhotoItem photoItem) {
    _router.push(PhotoDetailRouter(photoItem: photoItem));
  }
}
