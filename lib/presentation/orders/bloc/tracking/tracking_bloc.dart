// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_onlineshop_app/data/datasource/rajaongkir_remote_datasource.dart';
import 'package:flutter_onlineshop_app/data/models/responses/tracking_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tracking_bloc.freezed.dart';
part 'tracking_event.dart';
part 'tracking_state.dart';

class TrackingBloc extends Bloc<TrackingEvent, TrackingState> {
  final RajaongkirRemoteDatasource rajaongkirRemoteDatasource;
  TrackingBloc(
    this.rajaongkirRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetTracking>((event, emit) async {
      emit(const _Loading());
      final response =
          await rajaongkirRemoteDatasource.tracking(event.courier, event.resi);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
