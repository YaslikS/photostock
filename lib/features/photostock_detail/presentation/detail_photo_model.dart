import 'package:flutter/foundation.dart';
import 'package:flutter_template/core/architecture/presentation/base_model.dart';
import 'package:flutter_template/features/photostock_detail/presentation/detail_photo_state.dart';
import 'package:flutter_template/features/photostock_list/presentation/photo_list_screen.dart';

/// {@template detail_photo_model.class}
/// [DetailPhotoModel] for [PhotoListScreen].
/// {@endtemplate}
final class DetailPhotoModel extends BaseModel {
  final _state = ValueNotifier<DetailPhotoState>(const DetailPhotoStateInitial());

  /// State of screen.
  ValueListenable<DetailPhotoState> get state => _state;

  /// {@macro detail_photo_model.class}
  DetailPhotoModel({
    required super.logWriter,
  });

  @override
  void dispose() {
    _state.dispose();
    super.dispose();
  }

  /// Some info fun
  void someInfo() {}
}
