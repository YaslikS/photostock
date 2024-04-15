import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/mixin/localization_mixin.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/common/utils/mixin/theme_wm_mixin.dart';
import 'package:flutter_template/features/photostock_list/di/photo_list_scope.dart';
import 'package:flutter_template/features/photostock_list/presentation/photo_list_model.dart';
import 'package:flutter_template/features/photostock_list/presentation/photo_list_screen.dart';
import 'package:flutter_template/features/photostock_list/presentation/new_list_state.dart';
import 'package:flutter_template/features/photostock_list/presentation/screen_list_state.dart';
import 'package:provider/provider.dart';

/// DI factory for [PhotoListWM].
PhotoListWM photoListWMFactory(BuildContext context) {
  final appScope = context.read<IAppScope>();
  final scope = context.read<IPhotoListScope>();
  final scaffoldMessenger = ScaffoldMessenger.of(context);

  return PhotoListWM(
    PhotoListModel(
      repository: scope.repository,
      logWriter: appScope.logger,
    ),
    page: 1,
    scaffoldMessenger: scaffoldMessenger,
  );
}

/// Interface for [PhotoListWM].
abstract interface class IPhotoListWM
    with ThemeIModelMixin, ILocalizationMixin
    implements IWidgetModel {
  /// State of screen.
  ValueListenable<ScreenListState> get state;

  /// State of new photos.
  ValueListenable<NewListState> get stateNewList;

  /// updating list
  void listNeedsUpdate();

  /// update list of photos
// PhotosListWidget updateList(List<PhotoItem> newPhotos);
}

/// {@template photo_list_wm.class}
/// [WidgetModel] for [PhotoListScreen].
/// {@endtemplate}
final class PhotoListWM extends WidgetModel<PhotoListScreen, PhotoListModel>
    with ThemeWMMixin, LocalizationMixin
    implements IPhotoListWM {
  @override
  ValueListenable<ScreenListState> get state => model.state;

  @override
  ValueListenable<NewListState> get stateNewList => model.stateNewList;

  /// current page
  int page;

  final ScaffoldMessengerState _scaffoldMessenger;

  /// {@macro photo_list_wm.class}
  PhotoListWM(
    super._model, {
    required this.page,
    required ScaffoldMessengerState scaffoldMessenger,
  }) : _scaffoldMessenger = scaffoldMessenger;

  @override
  void listNeedsUpdate() {
    model.loadPhotos(page++);
  }

  @override
  void initWidgetModel() {
    model.loadPhotos(page++);
    super.initWidgetModel();
  }

  void _showErrorAppSnackBar() {
    _scaffoldMessenger.showSnackBar(
      SnackBar(content: Text(l10n.photoListFailedLoadListPhotoMessage)),
    );
  }
}
