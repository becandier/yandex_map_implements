import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'geolocator_cubit.freezed.dart';
part 'geolocator_state.dart';

class GeolocatorCubit extends Cubit<GeolocatorState> {
  GeolocatorCubit() : super(const GeolocatorState());

  /// Инициализация геолокации
  Future<void> init() async {
    await _checkPermissions();
  }

  /// Проверка разрешений
  Future<void> _checkPermissions() async {
    emit(state.copyWith(status: GeolocatorStatus.loading));
    
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      emit(state.copyWith(
        status: GeolocatorStatus.error,
        errorMessage: 'Службы геолокации отключены',
      ));
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(state.copyWith(
          status: GeolocatorStatus.error,
          errorMessage: 'Разрешение на геолокацию отклонено',
        ));
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      emit(state.copyWith(
        status: GeolocatorStatus.error,
        errorMessage: 'Разрешение на геолокацию отклонено навсегда',
      ));
      return;
    }

    await getCurrentPosition();
  }

  /// Получение текущей позиции
  Future<void> getCurrentPosition() async {
    try {
      emit(state.copyWith(status: GeolocatorStatus.loading));
      
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      
      emit(state.copyWith(
        status: GeolocatorStatus.success,
        currentPosition: position,
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: GeolocatorStatus.error,
        errorMessage: 'Ошибка получения геолокации: $e',
      ));
    }
  }

  /// Запуск отслеживания позиции
  void startLocationTracking() {
    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    ).listen(
      (Position position) {
        emit(state.copyWith(
          currentPosition: position,
          status: GeolocatorStatus.success,
        ));
      },
      onError: (error) {
        emit(state.copyWith(
          status: GeolocatorStatus.error,
          errorMessage: 'Ошибка отслеживания геолокации: $error',
        ));
      },
    );
  }
}
