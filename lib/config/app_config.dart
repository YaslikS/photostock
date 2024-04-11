import 'package:flutter_template/config/url.dart';

/// {@template app_config.class}
/// Application configuration.
/// {@endtemplate}
class AppConfig {
  /// Server url.
  final Url url;

  /// Proxy url.
  final String? proxyUrl;

  /// access key for
  final String accessKey =
      '896d4f52c589547b2134bd75ed48742db637fa51810b49b607e37e46ab2c0043';

  final String page = '&page=';

  /// {@macro app_config.class}
  const AppConfig({
    required this.url,
    this.proxyUrl,
  });
}
