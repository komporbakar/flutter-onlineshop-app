// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_onlineshop_app/data/models/requests/order_request_model.dart';
import 'package:flutter_onlineshop_app/data/models/responses/order_response_model.dart';
import 'package:flutter_onlineshop_app/presentation/home/models/product_quantity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasource/order_remote_datasource.dart';

part 'order_bloc.freezed.dart';
part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRemoteDatasource orderRemoteDatasource;
  OrderBloc(
    this.orderRemoteDatasource,
  ) : super(const _Initial()) {
    on<_CreateOrder>((event, emit) async {
      emit(const _Loading());
      final orderRequestModel = OrderRequestModel(
        addressId: event.addressId,
        paymentMethod: 'bank_transfer',
        shippingService: event.shippingService,
        shippingCost: event.shippingCost,
        paymentName: event.paymentName,
        items: event.products
            .map((e) => Item(productId: e.product.id!, quantity: e.quantity))
            .toList(),
      );
      final response =
          await orderRemoteDatasource.createOrder(orderRequestModel);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
