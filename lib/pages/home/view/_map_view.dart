part of 'home_page.dart';

class _MapView extends StatefulWidget {
  const _MapView();

  @override
  State<_MapView> createState() => _MapViewState();
}

class _MapViewState extends State<_MapView> {
  /// Статус карты
  bool _isMapReady = false;

  /// MapWindow
  late final MapWindow _mapWindow;

  /// Слушатель событий onTap по маркеру станции
  late final StationTapListener _stationTapListener;

  /// Кластерный слушатель
  late final ClusterListener _clusterListener;

  /// Маркер текущего положения
  PlacemarkMapObject? userLocation;
  CircleMapObject? userLocationCircleMapObject;

  /// Маркеры станций
  Map<String, PlacemarkMapObject> stationMarkers = {};

  /// Выбранная станция
  StationM? selectedStation;

  @override
  void initState() {
    super.initState();
    _stationTapListener = StationTapListener();

    _clusterListener = ClusterListenerImpl();
    setUserLocationPlaceMark(latitude: 55.755826, longitude: 37.6173);
  }

  /// Событие onTap по маркеру станции
  void selectStation(StationM newStation) {
    if (selectedStation == newStation) return;
    updateSelectedStationIcon(newStation, selectedStation);
    selectedStation = newStation;
    goToStationLocation(newStation);
    context.router.push(
      StationModalRoute(
        station: newStation,
        onPop: () {
          // Сбрасываем иконку выбранной станции
          updateSelectedStationIcon(null, newStation);
          selectedStation = null;
        },
      ),
    );
  }

  /// Устанавливает маркер текущего положения
  void setUserLocationPlaceMark({
    required double latitude,
    required double longitude,
  }) {
    if (!_isMapReady) return;
    userLocation ??= _mapWindow.map.mapObjects.addPlacemark();
    userLocation
      ?..geometry = Point(latitude: latitude, longitude: longitude)
      ..setIcon(
        image_provider.ImageProvider.fromImageProvider(
          AssetImage(Assets.images.myLocationMarker.path),
        ),
      )
      ..setIconStyle(const IconStyle(scale: 1.2));
    userLocationCircleMapObject ??=
        _mapWindow.map.mapObjects.addCircle(
            Circle(Point(latitude: latitude, longitude: longitude), radius: 0),
          )
          ..fillColor = context.colorScheme.primary.withValues(alpha: 0.4)
          ..strokeColor = context.colorScheme.primary.withValues(alpha: 0.8);
    userLocationCircleMapObject?.geometry = Circle(
      Point(latitude: latitude, longitude: longitude),
      radius: 40,
    );
  }

  /// Увеличивает масштаб карты
  void _zoomIn() {
    if (!_isMapReady) return;
    final cameraPosition = _mapWindow.map.cameraPosition;
    _mapWindow.map.moveWithAnimation(
      CameraPosition(
        cameraPosition.target,
        zoom: cameraPosition.zoom + 1,
        azimuth: cameraPosition.azimuth,
        tilt: cameraPosition.tilt,
      ),
      const Animation(AnimationType.Linear, duration: 0.3),
    );
  }

  /// Уменьшает масштаб карты
  void _zoomOut() {
    if (!_isMapReady) return;
    final cameraPosition = _mapWindow.map.cameraPosition;
    _mapWindow.map.moveWithAnimation(
      CameraPosition(
        cameraPosition.target,
        zoom: cameraPosition.zoom - 1,
        azimuth: cameraPosition.azimuth,
        tilt: cameraPosition.tilt,
      ),
      const Animation(AnimationType.Linear, duration: 0.3),
    );
  }

  /// Перемещает карту к текущему положению
  void goToCurrentPosition() {
    final state = context.read<GeolocatorCubit>().state;
    if (_isMapReady) {
      final position = state.currentPosition;
      if (position case final position?) {
        _mapWindow.map.moveWithAnimation(
          CameraPosition(
            Point(latitude: position.latitude, longitude: position.longitude),
            zoom: 15,
            azimuth: 0,
            tilt: 0,
          ),
          const Animation(AnimationType.Linear, duration: 0.3),
        );
      }
    }
  }

  /// Создает маркеры станций на карте
  void createStationMarkers(List<StationM> stations) {
    if (!_isMapReady) return;

    final clusterizedPlacemarkCollection = _mapWindow.map.mapObjects
        .addClusterizedPlacemarkCollection(_clusterListener);

    for (final station in stations) {
      if (station.location case final location?) {
        final marker = clusterizedPlacemarkCollection.addPlacemark()
          ..geometry = Point(
            latitude: location.latitude,
            longitude: location.longitude,
          )
          ..setIcon(_ConstantsMarkers.stationDefaultMarker(station))
          ..setIconStyle(const IconStyle(scale: 1.5))
          ..addTapListener(_stationTapListener)
          ..userData = () {
            selectStation(station);
          };

        stationMarkers[station.id.toString()] = marker;
      }
      clusterizedPlacemarkCollection.clusterPlacemarks(
        clusterRadius: 60,
        minZoom: 15,
      );
    }
  }

  /// Обновляет иконку выбранной станции
  void updateSelectedStationIcon(
    StationM? selectedStation,
    StationM? previousStation,
  ) {
    final markers = stationMarkers;

    // Установить выбранную иконку
    if (selectedStation != null) {
      final selectedMarker = markers[selectedStation.id.toString()];
      selectedMarker?.setIcon(
        _ConstantsMarkers.stationSelectedMarker(selectedStation),
      );
      selectedMarker?.setIconStyle(
        const IconStyle(
          scale: 1.5, // Увеличиваем размер для выбранной станции
        ),
      );
    }

    if (previousStation != null) {
      final previousMarker = markers[previousStation.id.toString()];
      previousMarker?.setIcon(
        _ConstantsMarkers.stationDefaultMarker(previousStation),
      );
      previousMarker?.setIconStyle(
        const IconStyle(
          scale: 1.5, // Увеличиваем размер для выбранной станции
        ),
      );
    }
  }

  /// Перемещает карту к местоположению станции
  void goToStationLocation(StationM station) {
    if (!_isMapReady) return;
    if (station.location case final location?) {
      _mapWindow.map.moveWithAnimation(
        CameraPosition(
          Point(latitude: location.latitude, longitude: location.longitude),
          zoom: 18,
          azimuth: 0,
          tilt: 0,
        ),
        const Animation(AnimationType.Linear, duration: 0.3),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        /// СОздаем маркеры когда доступны станции
        BlocListener<StationsOnMapCubit, StationsOnMapState>(
          listenWhen: (previous, current) =>
              previous.stations.length != current.stations.length,
          listener: (context, state) {
            if (_isMapReady && state.stations.isNotEmpty) {
              createStationMarkers(state.stations);
            }
          },
        ),

        /// Создаем маркер текущего положения пользователя
        BlocListener<GeolocatorCubit, GeolocatorState>(
          listener: (context, state) {
            if (_isMapReady) {
              if (state.currentPosition case final position?) {
                setUserLocationPlaceMark(
                  latitude: position.latitude,
                  longitude: position.longitude,
                );
              }
            }
          },
        ),

        /// Перемещаем карту к текущему положению пользователя
        BlocListener<GeolocatorCubit, GeolocatorState>(
          listenWhen: (previous, current) =>
              previous.currentPosition == null &&
              current.currentPosition != null,
          listener: (context, state) {
            goToCurrentPosition();
          },
        ),
      ],
      child: BlocBuilder<StationsOnMapCubit, StationsOnMapState>(
        builder: (context, state) {
          return Stack(
            children: [
              FlutterMapWidget(
                onMapCreated: (mapWindow) {
                  _mapWindow = mapWindow;
                  _isMapReady = true;
                },
              ),
              if (state.isLoading) _loadingStationsSection(),
              _zoomSection(context),
            ],
          );
        },
      ),
    );
  }

  /// Индикатор загрузки станций
  Center _loadingStationsSection() {
    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColorStyles.white,
          borderRadius: BorderRadius.circular(32),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }

  /// Кнопка зума
  Positioned _zoomSection(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.4,
      right: 16,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColorStyles.white,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 2,
              color: AppColorStyles.black.withValues(alpha: 0.1),
            ),
          ],
        ),
        child: Column(
          children: [
            IconButton(
              tooltip: context.l10n.zoom_in,
              onPressed: () {
                HapticFeedback.lightImpact();
                _zoomIn();
              },
              iconSize: 24,
              icon: const Icon(LucideIcons.plus, color: AppColorStyles.purple),
            ),
            const SizedBox(height: 5),
            Container(
              width: 30,
              height: 1,
              color: AppColorStyles.gray.withValues(alpha: 0.2),
            ),
            const SizedBox(height: 5),
            IconButton(
              tooltip: context.l10n.zoom_out,
              onPressed: () {
                HapticFeedback.lightImpact();
                _zoomOut();
              },
              iconSize: 24,
              icon: const Icon(LucideIcons.minus, color: AppColorStyles.purple),
            ),
          ],
        ),
      ),
    );
  }
}
