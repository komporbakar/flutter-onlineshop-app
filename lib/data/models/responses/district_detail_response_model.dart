import 'dart:convert';

class DistrictDetailResponseModel {
  final List<Address>? address;

  DistrictDetailResponseModel({
    this.address,
  });

  factory DistrictDetailResponseModel.fromJson(String str) =>
      DistrictDetailResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DistrictDetailResponseModel.fromMap(Map<String, dynamic> json) =>
      DistrictDetailResponseModel(
        address: json["address"] == null
            ? []
            : List<Address>.from(
                json["address"]!.map((x) => Address.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "address": address == null
            ? []
            : List<dynamic>.from(address!.map((x) => x.toMap())),
      };
}

class Address {
  final int? id;
  final String? name;
  final String? fullAddress;
  final String? phone;
  final String? provId;
  final String? cityId;
  final String? districtId;
  final String? postalCode;
  final int? userId;
  final int? isDefault;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Address({
    this.id,
    this.name,
    this.fullAddress,
    this.phone,
    this.provId,
    this.cityId,
    this.districtId,
    this.postalCode,
    this.userId,
    this.isDefault,
    this.createdAt,
    this.updatedAt,
  });

  factory Address.fromJson(String str) => Address.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Address.fromMap(Map<String, dynamic> json) => Address(
        id: json["id"],
        name: json["name"],
        fullAddress: json["full_address"],
        phone: json["phone"],
        provId: json["prov_id"],
        cityId: json["city_id"],
        districtId: json["district_id"],
        postalCode: json["postal_code"],
        userId: json["user_id"],
        isDefault: json["is_default"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "full_address": fullAddress,
        "phone": phone,
        "prov_id": provId,
        "city_id": cityId,
        "district_id": districtId,
        "postal_code": postalCode,
        "user_id": userId,
        "is_default": isDefault,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
