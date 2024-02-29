// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_onlineshop_app/data/datasource/order_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/responses/history_order_response_model.dart';

part 'history_order_bloc.freezed.dart';
part 'history_order_event.dart';
part 'history_order_state.dart';

class HistoryOrderBloc extends Bloc<HistoryOrderEvent, HistoryOrderState> {
  final OrderRemoteDatasource orderRemoteDatasource;
  HistoryOrderBloc(
    this.orderRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetOrderByUserId>((event, emit) async {
      emit(const HistoryOrderState.loading());
      final response = await orderRemoteDatasource.getOrderByUserId();
      response.fold(
        (l) => emit(HistoryOrderState.error(l)),
        (r) => emit(HistoryOrderState.loaded(r)),
      );
    });
  }
}
