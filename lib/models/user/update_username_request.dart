class UpdateUsernameRequest {
  final String username;

  UpdateUsernameRequest({required this.username});
  
  Map<String, dynamic> toJson() => {'username': username};
}