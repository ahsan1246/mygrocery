import 'package:freezed_annotation/freezed_annotation.dart';

import '/configs/config.dart';

part 'category.freezed.dart';
part 'category.g.dart';

List<Category> categoriesFromJson(dynamic str) =>
    List<Category>.from((str).map((e) => Category.fromJson(e)));

@freezed
abstract class Category with _$Category {
  factory Category({
    required String categoryId,
    required String categoryName,
    String? categoryDescription,
    String? categoryImage,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}

extension CategoryExt on Category {
  String get fullCategoryImagePath =>
      categoryImage != null && categoryImage!.isNotEmpty ? Config.mediaBaseUrl + categoryImage! : '';
}

/// after define these two methods, run bottom command to generate file
// flutter pub run build_runner build --delete-conflicting-outputs