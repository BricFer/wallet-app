class GroupRequest {
  final String name;
  final String description;
  final double budgetLimit;

  GroupRequest({
    required this.name,
    required this.description,
    required this.budgetLimit
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'description': description,
    'budgetLimit': budgetLimit,
  };
}
