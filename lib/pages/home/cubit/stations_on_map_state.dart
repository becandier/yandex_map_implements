part of 'stations_on_map_cubit.dart';

@freezed
abstract class StationsOnMapState with _$StationsOnMapState {
  factory StationsOnMapState({
    @Default([]) List<StationM> stations,
    @Default(FeatureStatus.initial) FeatureStatus status,
    @Default(null) Map<String, String?>? errors,
    @Default(null) String? errorMessage,
  }) = _StationsOnMapState;

  StationsOnMapState._();

  bool get isLoading =>
      status == FeatureStatus.loading || status == FeatureStatus.initial;
}
