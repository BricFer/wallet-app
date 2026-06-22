class GroupResponse {
  final int groupId;
  final String name;
  final String? description;
  final double budgetLimit;
  final bool isActive;

  GroupResponse({
    required this.groupId,
    required this.name,
    this.description,
    required this.budgetLimit,
    required this.isActive,
  });

  factory GroupResponse.fromJson(Map<String, dynamic> json) => GroupResponse(
    groupId: json['groupId'],
    name: json['name'],
    description: json['description'],
    budgetLimit: json['budgetLimit'],
    isActive: (json['isActive'] as bool),
  );
}
