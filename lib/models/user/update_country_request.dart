class UpdateCountryRequest {
  final String country;

  UpdateCountryRequest({required this.country});

  Map<String, dynamic> toJson() => {'country': country};
} 