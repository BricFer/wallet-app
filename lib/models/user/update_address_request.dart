class UpdateAddressRequest {
  final String address;

  UpdateAddressRequest({required this.address});

  Map<String, dynamic> toJson() => {'address': address};
} 