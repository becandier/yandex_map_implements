part of 'home_page.dart';

class _ConstantsMarkers {
  /// Возвращает иконку станции в зависимости от ее состояния
  static image_provider.ImageProvider stationDefaultMarker(StationM station) {
    if (station.isWorked) {
      return image_provider.ImageProvider.fromImageProvider(
        AssetImage(
          Assets.images.stationMarker.path,
        ),
      );
    } else {
      return image_provider.ImageProvider.fromImageProvider(
        AssetImage(
          Assets.images.disableStatitionMarker.path,
        ),
      );
    }
  }

  /// Возвращает иконку станции когда она выбрана
  static image_provider.ImageProvider stationSelectedMarker(StationM station) {
    return image_provider.ImageProvider.fromImageProvider(
      AssetImage(
        Assets.images.selectedStationMarker.path,
      ),
    );
  }

  static ViewProvider clusterMarker(int count) {
    return ViewProvider(
      builder: () => DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColorStyles.primary,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            '$count',
            style: const TextStyle(
              color: AppColorStyles.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}
