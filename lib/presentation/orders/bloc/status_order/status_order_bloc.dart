// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_onlineshop_app/data/datasource/order_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'status_order_bloc.freezed.dart';
part 'status_order_event.dart';
part 'status_order_state.dart';

class StatusOrderBloc extends Bloc<StatusOrderEvent, StatusOrderState> {
  final OrderRemoteDatasource orderRemoteDatasource;
  StatusOrderBloc(
    this.orderRemoteDatasource,
  ) : super(const _Initial()) {
    on<_CheckPaymentStatus>((event, emit) async {
      emit(const StatusOrderState.loading());
      final result =
          await orderRemoteDatasource.checkPaymentStatus(event.orderId);
      result.fold(
        (l) => emit(StatusOrderState.error(message: l)),
        (r) => emit(StatusOrderState.loaded(r)),
      );
    });
  }
}
