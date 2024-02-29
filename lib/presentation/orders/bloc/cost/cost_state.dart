part of 'cost_bloc.dart';

@freezed
class CostState with _$CostState {
  const factory CostState.initial() = _Initial;
  const factory CostState.loading() = _Loading;
  const factory CostState.loaded(CostResponseModel costResponseModel) = _Loaded;
  const factory CostState.error({required String message}) = _Error;
}
