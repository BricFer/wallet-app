import 'package:wallet_app/models/budget.dart';

class CategoryBudget extends Budget {
  final String categoryId;

  CategoryBudget({
    required super.id,
    required super.userId,
    required super.amount,
    required super.currency,
    required super.period,
    required super.alertThreshold,
    required super.isActive,
    required super.createdAt,
    required super.updatedAt,
    required this.categoryId,
  });
}
