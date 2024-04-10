import 'package:flutter/foundation.dart';
import 'package:flutter_template/common/utils/extentions/value_notifier_x.dart';
import 'package:flutter_template/core/architecture/domain/entity/result.dart';
import 'package:flutter_template/core/architecture/presentation/base_model.dart';
import 'package:flutter_template/features/photostock_detail/presentation/detail_photo_state.dart';
import 'package:flutter_template/features/photostock_list/domain/repositories/i_photos_repository.dart';
import 'package:flutter_template/features/photostock_list/presentation/photo_list_screen.dart';
import 'package:flutter_template/features/photostock_list/presentation/photo_list_state.dart';

/// {@template detail_photo_model.class}
/// [DetailPhotoModel] for [PhotoListScreen].
/// {@endtemplate}
final class DetailPhotoModel extends BaseModel {
  // final IPhotosRepository _repository;

  final _state = ValueNotifier<DetailPhotoState>(const DetailPhotoStateInitial());

  /// State of screen.
  ValueListenable<DetailPhotoState> get state => _state;

  /// {@macro detail_photo_model.class}
  DetailPhotoModel({
    // required IPhotosRepository repository,
    required super.logWriter,
  });// : _repository = repository;

  @override
  void dispose() {
    _state.dispose();
    super.dispose();
  }

  /// Some info fun
  void someInfo(){
    if (kDebugMode) {
      print("someInfo");
    }
  }

}
