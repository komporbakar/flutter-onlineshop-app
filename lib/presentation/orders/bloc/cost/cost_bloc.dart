// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_onlineshop_app/data/models/responses/cost_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasource/rajaongkir_remote_datasource.dart';

part 'cost_bloc.freezed.dart';
part 'cost_event.dart';
part 'cost_state.dart';

class CostBloc extends Bloc<CostEvent, CostState> {
  final RajaongkirRemoteDatasource rajaongkirRemoteDatasource;
  CostBloc(
    this.rajaongkirRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetCost>((event, emit) async {
      emit(const _Loading());
      final response = await rajaongkirRemoteDatasource.getCost(
        event.origin,
        event.destination,
        'jne',
        event.weight,
      );
      response.fold(
        (l) => emit(_Error(message: l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
