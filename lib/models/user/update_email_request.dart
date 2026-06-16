class UpdateEmailRequest {
  final String email;

  UpdateEmailRequest({required this.email});
  
  Map<String, dynamic> toJson() => {'email': email};
}