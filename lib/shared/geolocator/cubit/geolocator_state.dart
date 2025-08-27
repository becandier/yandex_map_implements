part of 'geolocator_cubit.dart';

@freezed
class GeolocatorState with _$GeolocatorState {
  const factory GeolocatorState({
    @Default(GeolocatorStatus.initial) GeolocatorStatus status,
    Position? currentPosition,
    @Default(null) String? errorMessage,
  }) = _GeolocatorState;
}

enum GeolocatorStatus {
  initial,
  loading,
  success,
  error,
}

extension GeolocatorStateExtension on GeolocatorState {
  bool get isLoading => status == GeolocatorStatus.loading;
  bool get isSuccess => status == GeolocatorStatus.success;
  bool get isError => status == GeolocatorStatus.error;
}
