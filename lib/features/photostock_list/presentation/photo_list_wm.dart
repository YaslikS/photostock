import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/api/data/photo_item.dart';
import 'package:flutter_template/common/mixin/localization_mixin.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/common/utils/mixin/theme_wm_mixin.dart';
import 'package:flutter_template/features/common/utils/sizes/app_constants.dart';
import 'package:flutter_template/features/photostock_list/di/photo_list_scope.dart';
import 'package:flutter_template/features/photostock_list/presentation/photo_list_model.dart';
import 'package:flutter_template/features/photostock_list/presentation/photo_list_screen.dart';
import 'package:flutter_template/features/photostock_list/presentation/photo_list_state.dart';
import 'package:flutter_template/features/photostock_list/presentation/widgets/photos_list_widget.dart';
import 'package:flutter_template/l10n/app_localizations_x.dart';
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
    AppConstants.int1,
    [],
    scaffoldMessenger: scaffoldMessenger,
  );
}

/// Interface for [PhotoListWM].
abstract interface class IPhotoListWM
    with ThemeIModelMixin, ILocalizationMixin
    implements IWidgetModel {
  /// State of screen.
  ValueListenable<PhotoListState> get state;

  /// updating list
  void listNeedsUpdate();

  /// update list of photos
  PhotosListWidget updateList(List<PhotoItem> newPhotos);
}

/// {@template photo_list_wm.class}
/// [WidgetModel] for [PhotoListScreen].
/// {@endtemplate}
final class PhotoListWM extends WidgetModel<PhotoListScreen, PhotoListModel>
    with ThemeWMMixin, LocalizationMixin
    implements IPhotoListWM {
  @override
  ValueListenable<PhotoListState> get state => model.state;

  /// current page
  int page;

  final ScaffoldMessengerState _scaffoldMessenger;
  /// current list of photos
  List<PhotoItem> currentPhotos;

  /// {@macro photo_list_wm.class}
  PhotoListWM(
    super._model,
    this.page,
    this.currentPhotos, {
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

  @override
  PhotosListWidget updateList(List<PhotoItem> newPhotos) {
    final count = currentPhotos.length;
    currentPhotos.addAll(newPhotos);
    return PhotosListWidget(
      photosList: currentPhotos,
      listNeedsUpdate: listNeedsUpdate,
      oldLastItem: count,
    );
  }

  void _showErrorAppSnackBar() {
    final _ = _scaffoldMessenger
        .showSnackBar(SnackBar(content: Text(l10n.photoListFailedLoadListPhotoMessage)));
  }
}
