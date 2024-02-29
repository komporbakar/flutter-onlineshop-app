part of 'cost_bloc.dart';

@freezed
class CostEvent with _$CostEvent {
  const factory CostEvent.started() = _Started;
  const factory CostEvent.getCost({
    required String origin,
    required String destination,
    required String courier,
    required int weight,
  }) = _GetCost;
}
