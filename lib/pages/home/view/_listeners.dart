part of 'home_page.dart';

/// Слушатель событий onTap по маркеру станции
final class StationTapListener implements MapObjectTapListener {
  @override
  bool onMapObjectTap(MapObject mapObject, Point point) {
    if (mapObject.userData is void Function()) {
      (mapObject.userData! as void Function())();
    }
    return true;
  }
}

/// Слушатель событий добавления кластера
final class ClusterListenerImpl implements ClusterListener {
  @override
  void onClusterAdded(Cluster cluster) {
    cluster.appearance.setView(
      _ConstantsMarkers.clusterMarker(cluster.placemarks.length),
    );
  }
}
