part of 'order_bloc.dart';

@freezed
class OrderEvent with _$OrderEvent {
  const factory OrderEvent.started() = _Started;
  const factory OrderEvent.createOrder({
    required int addressId,
    required String paymentMethod,
    required String shippingService,
    required int shippingCost,
    required String paymentName,
    required List<ProductQuantity> products,
  }) = _CreateOrder;
}
