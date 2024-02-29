// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_onlineshop_app/data/models/responses/subdistrict_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasource/rajaongkir_remote_datasource.dart';

part 'subdistrict_bloc.freezed.dart';
part 'subdistrict_event.dart';
part 'subdistrict_state.dart';

class SubdistrictBloc extends Bloc<SubdistrictEvent, SubdistrictState> {
  final RajaongkirRemoteDatasource rajaongkirRemoteDatasource;
  SubdistrictBloc(
    this.rajaongkirRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetSubdistrict>((event, emit) async {
      emit(const _Loading());
      final response =
          await rajaongkirRemoteDatasource.getSubdistrictByCity(event.cityId);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.rajaongkir!.results ?? [])),
      );
    });
  }
}
