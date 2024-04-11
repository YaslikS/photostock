import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/mixin/localization_mixin.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/common/utils/mixin/theme_wm_mixin.dart';
import 'package:flutter_template/features/photostock_detail/di/detail_photo_scope.dart';
import 'package:flutter_template/features/photostock_detail/presentation/detail_photo_model.dart';
import 'package:flutter_template/features/photostock_detail/presentation/detail_photo_screen.dart';
import 'package:flutter_template/features/photostock_detail/presentation/detail_photo_state.dart';
import 'package:provider/provider.dart';

/// DI factory for [DetailPhotoWM].
DetailPhotoWM defaultDetailPhotoWMFactory(BuildContext context) {
  final appScope = context.read<IAppScope>();
  final scope = context.read<IDetailPhotoScope>();

  return DetailPhotoWM(
    DetailPhotoModel(
      logWriter: appScope.logger,
    ),
  );
}

/// Interface for [DetailPhotoWM].
abstract interface class IDetailPhotoWM
    with ThemeIModelMixin, ILocalizationMixin
    implements IWidgetModel {
  /// State of screen.
  ValueListenable<DetailPhotoState> get state;
}

/// {@template detail_photo_wm.class}
/// [WidgetModel] for [DetailPhotoScreen].
/// {@endtemplate}
final class DetailPhotoWM extends WidgetModel<DetailPhotoScreen, DetailPhotoModel>
    with ThemeWMMixin, LocalizationMixin
    implements IDetailPhotoWM {
  @override
  ValueListenable<DetailPhotoState> get state => model.state;

  /// {@macro detail_photo_wm.class}
  DetailPhotoWM(super._model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
  }
}
