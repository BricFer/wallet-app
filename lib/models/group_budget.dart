import 'package:wallet_app/models/budget.dart';

class GroupBudget extends Budget {
  final String groupId;
  final DateTime startDate;
  final DateTime? endDate;

  GroupBudget({
    required super.id,
    required super.userId,
    required super.amount,
    required super.currency,
    required super.period,
    required super.alertThreshold,
    required super.isActive,
    required super.createdAt,
    required super.updatedAt,
    required this.groupId,
    required this.startDate,
    this.endDate,
  });
}
