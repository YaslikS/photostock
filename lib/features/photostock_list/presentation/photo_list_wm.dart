import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/mixin/localization_mixin.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/common/utils/mixin/theme_wm_mixin.dart';
import 'package:flutter_template/features/photostock_list/di/photo_list_scope.dart';
import 'package:flutter_template/features/photostock_list/presentation/new_list_state.dart';
import 'package:flutter_template/features/photostock_list/presentation/photo_list_model.dart';
import 'package:flutter_template/features/photostock_list/presentation/photo_list_screen.dart';
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
  ValueListenable<ScreenListState> get screenState;

  /// State of new photos.
  ValueListenable<NewListState> get stateNewList;

  /// controller controls the scroll of the list
  ScrollController get scrollController;

  /// updating list
  void listNeedsUpdate();

  /// listener for a Scroll Controller
  void scrollListener();
}

/// {@template photo_list_wm.class}
/// [WidgetModel] for [PhotoListScreen].
/// {@endtemplate}
final class PhotoListWM extends WidgetModel<PhotoListScreen, PhotoListModel>
    with ThemeWMMixin, LocalizationMixin
    implements IPhotoListWM {
  @override
  ValueListenable<ScreenListState> get screenState => model.screenState;

  @override
  ValueListenable<NewListState> get stateNewList => model.stateNewList;

  /// current page
  int page;

  @override
  ScrollController get scrollController => scrollController1;

  final ScrollController scrollController1 = ScrollController();

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
    scrollController1.addListener(scrollListener);
    model.loadPhotos(page++);
    super.initWidgetModel();
  }

  @override
  void scrollListener() {
    if (scrollController1.offset >= scrollController1.positions.last.maxScrollExtent
        && !scrollController1.position.outOfRange
    ) {
      listNeedsUpdate();
    }
  }
}
