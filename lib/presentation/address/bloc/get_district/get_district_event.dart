part of 'get_district_bloc.dart';

@freezed
class GetDistrictEvent with _$GetDistrictEvent {
  const factory GetDistrictEvent.started() = _Started;
  const factory GetDistrictEvent.getDistricts(String districtId) =
      _GetDistricts;
}
