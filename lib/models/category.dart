enum CategoryType { income, expense }

class Category {
  final String id;
  final String name;
  final String iconPath;
  final CategoryType type;
  final DateTime createdAt;
  final DateTime updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.iconPath,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });
}
