// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_onlineshop_app/data/datasource/rajaongkir_remote_datasource.dart';
import 'package:flutter_onlineshop_app/data/models/responses/province_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'province_bloc.freezed.dart';
part 'province_event.dart';
part 'province_state.dart';

class ProvinceBloc extends Bloc<ProvinceEvent, ProvinceState> {
  final RajaongkirRemoteDatasource rajaongkirRemoteDatasource;
  ProvinceBloc(
    this.rajaongkirRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetProvince>((event, emit) async {
      emit(const _Loading());
      final response = await rajaongkirRemoteDatasource.getProvinces();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.rajaongkir!.results ?? [])),
      );
    });
  }
}
