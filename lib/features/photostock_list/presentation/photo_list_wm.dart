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
import 'package:flutter_template/features/photostock_list/presentation/screen_list_state.dart';
import 'package:flutter_template/features/photostock_list/presentation/uploaded_list_state.dart';
import 'package:provider/provider.dart';

/// DI factory for [PhotoListWM].
PhotoListWM photoListWMFactory(BuildContext context) {
  final appScope = context.read<IAppScope>();
  final scope = context.read<IPhotoListScope>();
  final appRouter = context.read<AppRouter>();
  final scaffoldMessenger = ScaffoldMessenger.of(context);

  return PhotoListWM(
    PhotoListModel(
      repository: scope.repository,
      logWriter: appScope.logger,
    ),
    router: appRouter,
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
  ValueListenable<UploadedListState> get stateNewList;

  /// for access the internal scrollController
  GlobalKey<NestedScrollViewState> get globalKey;

  /// controller controls the scroll of the list
  ScrollController get innerController;

  /// Navigate to detail photo screen.
  void openDetailPhotoScreen(PhotoItem photoItem);

  /// updating list
  void listNeedsUpdate();
}

/// {@template photo_list_wm.class}
/// [WidgetModel] for [PhotoListScreen].
/// {@endtemplate}
final class PhotoListWM extends WidgetModel<PhotoListScreen, PhotoListModel>
    with ThemeWMMixin, LocalizationMixin
    implements IPhotoListWM {
  final AppRouter _router;

  @override
  ValueListenable<ScreenListState> get screenState => model.screenState;

  @override
  ValueListenable<UploadedListState> get stateNewList => model.stateNewList;

  @override
  GlobalKey<NestedScrollViewState> get globalKey => _globalKey;

  final GlobalKey<NestedScrollViewState> _globalKey = GlobalKey();

  @override
  ScrollController get innerController {
    return _globalKey.currentState!.innerController;
  }

  /// current page
  int page;

  final ScaffoldMessengerState _scaffoldMessenger;

  /// {@macro photo_list_wm.class}
  PhotoListWM(
    super._model, {
    required this.page,
    required AppRouter router,
    required ScaffoldMessengerState scaffoldMessenger,
  })  : _scaffoldMessenger = scaffoldMessenger,
        _router = router;

  @override
  void listNeedsUpdate() {
    model.loadPhotos(page++);
  }

  @override
  void initWidgetModel() {
    model.loadPhotos(page++);
    _observerStateNewList();
    super.initWidgetModel();
  }

  @override
  void openDetailPhotoScreen(PhotoItem photoItem) {
    _router.push(PhotoDetailRouter(photoItem: photoItem));
  }

  void _observerStateNewList() {
    stateNewList.addListener(() {
      if (stateNewList.value is UploadedListStateError) {
        _showErrorAppSnackBar();
      }
    });
  }

  void _showErrorAppSnackBar() {
    _scaffoldMessenger.showSnackBar(
      SnackBar(content: Text(l10n.photoListFailedLoadListPhotoMessage)),
    );
  }
}
