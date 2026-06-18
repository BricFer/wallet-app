enum CategoryType {
  HOUSING,
  VEHICLE_TRANSPORT,
  SHOPPING,
  LEISURE_TRAVEL,
  OTHER_EXPENSES,
  FOOD,
  EDUCATION_HEALTH,
  SAVING,
  INSURANCE,
  LOAN,
  PAYROLL_INCOMES,
  INVESTMENT
}

class CategoryResponse {
  final int categoryId;
  final String name;
  final CategoryType type;
  final String iconKey;

  CategoryResponse({
    required this.categoryId,
    required this.name,
    required this.type,
    required this.iconKey,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      CategoryResponse(
        categoryId: json['categoryId'],
        name: json['name'],
        type: CategoryType.values.byName(json['type']),
        iconKey: json['iconKey'],
      );
}
