import 'dart:convert';

class OrderRequestModel {
  final int? addressId;
  final String? paymentMethod;
  final String? paymentName;
  final String? shippingService;
  final int? shippingCost;
  final List<Item>? items;

  OrderRequestModel({
    this.addressId,
    this.paymentMethod,
    this.paymentName,
    this.shippingService,
    this.shippingCost,
    this.items,
  });

  factory OrderRequestModel.fromJson(String str) =>
      OrderRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderRequestModel.fromMap(Map<String, dynamic> json) =>
      OrderRequestModel(
        addressId: json["address_id"],
        paymentMethod: json["payment_method"],
        paymentName: json["payment_name"],
        shippingService: json["shipping_service"],
        shippingCost: json["shipping_cost"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "address_id": addressId,
        "payment_method": paymentMethod,
        "payment_name": paymentName,
        "shipping_service": shippingService,
        "shipping_cost": shippingCost,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toMap())),
      };
}

class Item {
  final int? productId;
  final int? quantity;

  Item({
    this.productId,
    this.quantity,
  });

  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        productId: json["product_id"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toMap() => {
        "product_id": productId,
        "quantity": quantity,
      };
}
