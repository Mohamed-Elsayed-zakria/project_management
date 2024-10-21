import 'company_file.dart';

class CompanyInfo {
  String? id;
  String? companyName;
  String? commercialRegistrationNumber;
  String? phoneNumber;
  String? address;
  String? website;
  List<CompanyFile>? companyFiles;
  String? createdAt;
  String? updatedAt;
  int? v;

  CompanyInfo({
    this.id,
    this.companyName,
    this.commercialRegistrationNumber,
    this.phoneNumber,
    this.address,
    this.website,
    this.companyFiles,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CompanyInfo.fromJson(Map<String, dynamic> json) => CompanyInfo(
        id: json['_id'] as String?,
        companyName: json['companyName'] as String?,
        commercialRegistrationNumber:
            json['commercialRegistrationNumber'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        address: json['address'] as String?,
        website: json['website'] as String?,
        companyFiles: (json['companyFiles'] as List<dynamic>?)
            ?.map((e) => CompanyFile.fromJson(e as Map<String, dynamic>))
            .toList(),
        createdAt: json['createdAt'] as String?,
        updatedAt: json['updatedAt'] as String?,
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'companyName': companyName,
        'commercialRegistrationNumber': commercialRegistrationNumber,
        'phoneNumber': phoneNumber,
        'address': address,
        'website': website,
        'companyFiles': companyFiles?.map((e) => e.toJson()).toList(),
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v,
      };
}
