import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_template/config/config.dart';
import 'package:flutter_template/config/debug_options.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/config/urls.dart';
import 'package:flutter_template/features/app/service/coordinator.dart';
import 'package:flutter_template/features/debug/screen/debug_screen/debug_screen.dart';
import 'package:flutter_template/features/debug/screen/debug_screen/debug_screen_widget_model.dart';
import 'package:flutter_template/features/debug/service/debug_screen_service.dart';

// ignore_for_file: avoid_positional_boolean_parameters

/// Model for [DebugScreen].
class DebugScreenModel extends ElementaryModel {
  /// Interface for handle error in business logic.
  final ErrorHandler errorHandler;

  /// /// Service to work with [DebugScreen].
  final DebugScreenService debugScreenService;

  /// Environment configuration.
  final Environment<Config> environment;

  /// Callback to rebuild the whole application.
  final VoidCallback applicationRebuilder;

  /// Class that coordinates navigation for the whole app.
  final Coordinator coordinator;

  final _proxyValueState = StateNotifier<String>();

  /// Config change Notifier.
  late ValueNotifier<Config> configNotifier;

  /// Proxy state.
  StateNotifier<String> get proxyValueState => _proxyValueState;

  /// Create an instance [DebugScreenModel].
  DebugScreenModel(
    this.errorHandler,
    this.debugScreenService,
    this.environment,
    this.applicationRebuilder,
    this.coordinator,
  ) : super(errorHandler: errorHandler);

  @override
  void init() {
    configNotifier = ValueNotifier<Config>(environment.config);
    environment.addListener(_environmentChangedCallback);
  }

  @override
  void dispose() {
    environment.removeListener(_environmentChangedCallback);
  }

  /// Show push notification.
  void showDebugNotification() =>
      debugScreenService.showDebugScreenNotification();

  /// Switch server.
  void switchServer(UrlType urlType) {
    Config newConfig;
    switch (urlType) {
      case UrlType.test:
        newConfig = configNotifier.value.copyWith(url: Url.testUrl);
        break;
      case UrlType.prod:
        newConfig = configNotifier.value.copyWith(url: Url.prodUrl);
        break;
      default:
        newConfig = configNotifier.value.copyWith(url: Url.devUrl);
        break;
    }
    _refreshApp(newConfig);
  }

  /// Change showPerformanceOverlay value in debugOptions.
  void showPerformanceOverlayChange(bool? value) {
    _setDebugOptionState(
      configNotifier.value.debugOptions.copyWith(showPerformanceOverlay: value),
    );
  }

  /// Change debugShowMaterialGrid value in debugOptions.
  void debugShowMaterialGridChange(bool? value) {
    _setDebugOptionState(
      configNotifier.value.debugOptions.copyWith(debugShowMaterialGrid: value),
    );
  }

  /// Change debugShowCheckedModeBanner value in debugOptions.
  void debugShowCheckedModeBannerChange(bool? value) {
    _setDebugOptionState(
      configNotifier.value.debugOptions
          .copyWith(debugShowCheckedModeBanner: value),
    );
  }

  /// Change checkerboardRasterCacheImages value in debugOptions.
  void checkerboardRasterCacheImagesChange(bool? value) {
    _setDebugOptionState(
      configNotifier.value.debugOptions
          .copyWith(checkerboardRasterCacheImages: value),
    );
  }

  /// Change checkerboardOffscreenLayers value in debugOptions.
  void checkerboardOffscreenLayersChange(bool? value) {
    _setDebugOptionState(
      configNotifier.value.debugOptions
          .copyWith(checkerboardOffscreenLayers: value),
    );
  }

  /// Change showSemanticsDebugger value in debugOptions.
  void showSemanticsDebuggerChange(bool? value) {
    _setDebugOptionState(
      configNotifier.value.debugOptions.copyWith(showSemanticsDebugger: value),
    );
  }

  /// Change proxyUrl value.
  void setProxy() {
    configNotifier.value =
        configNotifier.value.copyWith(proxyUrl: proxyValueState.value);
    _refreshApp(configNotifier.value);
  }

  void _refreshApp(Config newConfig) {
    configNotifier.value = newConfig;

    applicationRebuilder();
  }

  void _setDebugOptionState(DebugOptions newOpt) {
    _setConfig(configNotifier.value.copyWith(debugOptions: newOpt));
  }

  // ignore: use_setters_to_change_properties
  void _setConfig(Config newConfig) {
    environment.config = newConfig;
  }

  void _environmentChangedCallback() {
    configNotifier.value = environment.config;
  }
}
