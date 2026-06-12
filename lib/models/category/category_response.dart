import 'package:wallet_app/models/category.dart';

class CategoryResponse {
  final int categoryId;
  final String name;
  final CategoryType type;

  CategoryResponse({
    required this.categoryId,
    required this.name,
    required this.type,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      CategoryResponse(
        categoryId: json['categoryId'],
        name: json['name'],
        type: CategoryType.values.byName(json['type']),
      );
}
