import 'dart:convert';

class HistoryOrderResponseModel {
  final List<HistoryOrder>? order;

  HistoryOrderResponseModel({
    this.order,
  });

  factory HistoryOrderResponseModel.fromJson(String str) =>
      HistoryOrderResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HistoryOrderResponseModel.fromMap(Map<String, dynamic> json) =>
      HistoryOrderResponseModel(
        order: json["order"] == null
            ? []
            : List<HistoryOrder>.from(
                json["order"]!.map((x) => HistoryOrder.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "order": order == null
            ? []
            : List<dynamic>.from(order!.map((x) => x.toMap())),
      };
}

class HistoryOrder {
  final int? id;
  final int? userId;
  final int? addressId;
  final String? trxId;
  final int? subtotal;
  final int? shippingCost;
  final int? totalCost;
  final String? status;
  final String? paymentMethod;
  final String? paymentName;
  final String? paymentVa;
  final dynamic paymentEwallet;
  final String? shippingService;
  final String? shippingResi;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final List<OrderItem>? orderItems;
  final User? user;

  HistoryOrder({
    this.id,
    this.userId,
    this.addressId,
    this.trxId,
    this.subtotal,
    this.shippingCost,
    this.totalCost,
    this.status,
    this.paymentMethod,
    this.paymentName,
    this.paymentVa,
    this.paymentEwallet,
    this.shippingService,
    this.shippingResi,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.orderItems,
    this.user,
  });

  factory HistoryOrder.fromJson(String str) =>
      HistoryOrder.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HistoryOrder.fromMap(Map<String, dynamic> json) => HistoryOrder(
        id: json["id"],
        userId: json["user_id"],
        addressId: json["address_id"],
        trxId: json["trx_id"],
        subtotal: json["subtotal"],
        shippingCost: json["shipping_cost"],
        totalCost: json["total_cost"],
        status: json["status"],
        paymentMethod: json["payment_method"],
        paymentName: json["payment_name"],
        paymentVa: json["payment_va"],
        paymentEwallet: json["payment_ewallet"],
        shippingService: json["shipping_service"],
        shippingResi: json["shipping_resi"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        orderItems: json["order_items"] == null
            ? []
            : List<OrderItem>.from(
                json["order_items"]!.map((x) => OrderItem.fromMap(x))),
        user: json["user"] == null ? null : User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "address_id": addressId,
        "trx_id": trxId,
        "subtotal": subtotal,
        "shipping_cost": shippingCost,
        "total_cost": totalCost,
        "status": status,
        "payment_method": paymentMethod,
        "payment_name": paymentName,
        "payment_va": paymentVa,
        "payment_ewallet": paymentEwallet,
        "shipping_service": shippingService,
        "shipping_resi": shippingResi,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "order_items": orderItems == null
            ? []
            : List<dynamic>.from(orderItems!.map((x) => x.toMap())),
        "user": user?.toMap(),
      };
}

class OrderItem {
  final int? id;
  final int? orderId;
  final int? productId;
  final int? quantity;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Product? product;

  OrderItem({
    this.id,
    this.orderId,
    this.productId,
    this.quantity,
    this.createdAt,
    this.updatedAt,
    this.product,
  });

  factory OrderItem.fromJson(String str) => OrderItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderItem.fromMap(Map<String, dynamic> json) => OrderItem(
        id: json["id"],
        orderId: json["order_id"],
        productId: json["product_id"],
        quantity: json["quantity"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        product:
            json["product"] == null ? null : Product.fromMap(json["product"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "order_id": orderId,
        "product_id": productId,
        "quantity": quantity,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "product": product?.toMap(),
      };
}

class Product {
  final int? id;
  final int? categoryId;
  final String? name;
  final String? description;
  final String? image;
  final int? price;
  final int? stock;
  final int? isAvailable;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Product({
    this.id,
    this.categoryId,
    this.name,
    this.description,
    this.image,
    this.price,
    this.stock,
    this.isAvailable,
    this.createdAt,
    this.updatedAt,
  });

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        categoryId: json["category_id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        price: json["price"],
        stock: json["stock"],
        isAvailable: json["is_available"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "category_id": categoryId,
        "name": name,
        "description": description,
        "image": image,
        "price": price,
        "stock": stock,
        "is_available": isAvailable,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class User {
  final int? id;
  final String? name;
  final String? email;
  final String? fcmId;
  final String? phone;
  final String? roles;
  final DateTime? emailVerifiedAt;
  final dynamic twoFactorSecret;
  final dynamic twoFactorRecoveryCodes;
  final dynamic twoFactorConfirmedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  User({
    this.id,
    this.name,
    this.email,
    this.fcmId,
    this.phone,
    this.roles,
    this.emailVerifiedAt,
    this.twoFactorSecret,
    this.twoFactorRecoveryCodes,
    this.twoFactorConfirmedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        fcmId: json["fcm_id"],
        phone: json["phone"],
        roles: json["roles"],
        emailVerifiedAt: json["email_verified_at"] == null
            ? null
            : DateTime.parse(json["email_verified_at"]),
        twoFactorSecret: json["two_factor_secret"],
        twoFactorRecoveryCodes: json["two_factor_recovery_codes"],
        twoFactorConfirmedAt: json["two_factor_confirmed_at"],
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
        "email": email,
        "fcm_id": fcmId,
        "phone": phone,
        "roles": roles,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "two_factor_secret": twoFactorSecret,
        "two_factor_recovery_codes": twoFactorRecoveryCodes,
        "two_factor_confirmed_at": twoFactorConfirmedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
