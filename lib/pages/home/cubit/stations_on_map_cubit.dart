import 'package:example_yandex_map/core/bloc/base_freezed_cubit.dart';
import 'package:example_yandex_map/core/constants/feature_statuses.dart';
import 'package:example_yandex_map/data/api/rental/models/_models.dart';
import 'package:example_yandex_map/data/repository/rental_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stations_on_map_cubit.freezed.dart';
part 'stations_on_map_state.dart';

class StationsOnMapCubit extends BaseFreezedCubit<StationsOnMapState> {
  StationsOnMapCubit({required RentalRepository rentalRepository})
    : _rentalRepository = rentalRepository,
      super(StationsOnMapState());

  final RentalRepository _rentalRepository;

  void init() {
    getStations();
  }

  Future<void> getStations() async {
    emit(state.copyWith(status: FeatureStatus.loading));
    await execute(
      call: () async {
        final stations = await _rentalRepository.getStations();
        emit(state.copyWith(stations: stations));
      },
      onSuccess: () {
        emit(state.copyWith(status: FeatureStatus.success));
      },
    );
  }

  @override
  void updateErrorMessage(String? errorMessage) {
    emit(state.copyWith(errorMessage: errorMessage));
  }

  @override
  void updateErrors(Map<String, String?>? errors) {
    emit(state.copyWith(errors: errors));
  }

  @override
  void updateStatus(FeatureStatus status) {
    emit(state.copyWith(status: status));
  }
}
