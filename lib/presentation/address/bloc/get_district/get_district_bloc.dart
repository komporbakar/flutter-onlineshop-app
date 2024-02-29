// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_onlineshop_app/data/models/responses/district_detail_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasource/address_remote_datasource.dart';

part 'get_district_bloc.freezed.dart';
part 'get_district_event.dart';
part 'get_district_state.dart';

class GetDistrictBloc extends Bloc<GetDistrictEvent, GetDistrictState> {
  final AddressRemoteDataSource addressRemoteDataSource;
  GetDistrictBloc(
    this.addressRemoteDataSource,
  ) : super(const _Initial()) {
    on<_GetDistricts>((event, emit) async {
      emit(const _Loading());
      final response =
          await addressRemoteDataSource.getDistricts(event.districtId);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
