part of 'get_district_bloc.dart';

@freezed
class GetDistrictState with _$GetDistrictState {
  const factory GetDistrictState.initial() = _Initial;
  const factory GetDistrictState.loading() = _Loading;
  const factory GetDistrictState.loaded(
      DistrictDetailResponseModel districtDetail) = _Loaded;
  const factory GetDistrictState.error(String message) = _Error;
}
