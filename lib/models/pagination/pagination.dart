import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.freezed.dart';

@freezed
abstract class PaginationModel with _$PaginationModel {
  factory PaginationModel({
    required int page,
    required int pageSize,
  }) = _PaginationModel;
}

/// after define these two methods, run bottom command to generate file
// flutter pub run build_runner build --delete-conflicting-outputs