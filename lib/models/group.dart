class Group {
  final String id;
  final String userId;
  final String name;
  final String? description;
  final double? budgetLimit;
  final String? color;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  Group({
    required this.id,
    required this.userId,
    required this.name,
    this.description,
    this.budgetLimit,
    this.color,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
}
