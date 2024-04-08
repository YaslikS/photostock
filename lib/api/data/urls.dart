import 'package:json_annotation/json_annotation.dart';

part 'urls.g.dart';

@JsonSerializable(explicitToJson: true)
class Urls {
  String regular;

  Urls({required this.regular});

  // From Json
  factory Urls.fromJson(Map<String, dynamic> json) =>
      _$UrlsFromJson(json);

  // ToJson
  Map<String, dynamic> toJson() => _$UrlsToJson(this);
}