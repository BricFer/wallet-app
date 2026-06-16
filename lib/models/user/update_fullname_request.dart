class UpdateFullnameRequest {
  final String fullname;

  UpdateFullnameRequest({required this.fullname});

  Map<String, dynamic> toJson() => {'fullname': fullname};
}
