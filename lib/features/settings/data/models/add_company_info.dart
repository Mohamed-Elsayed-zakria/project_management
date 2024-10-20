class AddCompanyInfo {
  final String? companyName;
  final String? commercialRegistrationNumber;
  final String? phoneNumber;
  final String? address;
  final String? website;

  AddCompanyInfo({
    this.companyName,
    this.commercialRegistrationNumber,
    this.phoneNumber,
    this.address,
    this.website,
  });

  Map<String, dynamic> toJson() => {
        'companyName': companyName,
        'commercialRegistrationNumber': commercialRegistrationNumber,
        'phoneNumber': phoneNumber,
        'address': address,
        'website': website,
      };
}
