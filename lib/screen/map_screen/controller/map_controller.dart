import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../model/filter_models.dart';
part 'map_controller.g.dart';
class MapState {
  final List<Item> places;
  final int? selectedIndex;
  final ScreenCoordinate? screenCoordinate;

  MapState({
    required this.places,
    this.selectedIndex,
    this.screenCoordinate,
  });

  MapState copyWith({
    int? selectedIndex,
    ScreenCoordinate? screenCoordinate,
  }) {
    return MapState(
      places: places,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      screenCoordinate: screenCoordinate ?? this.screenCoordinate,
    );
  }
}

/// A Riverpod AutoDisposeNotifier to manage MapPage state without setState.
@riverpod
class MapController extends _$MapController {
  late GoogleMapController _googleMapController;

  @override
  MapState build(List<Item> places) {
    // initial state: loaded with the list of places
    return MapState(places: places);
  }

  /// Called by UI when GoogleMap is created
  void onMapCreated(GoogleMapController controller) {
    _googleMapController = controller;
  }

  /// Called when user taps the map (clearing selection)
  void onMapTap(LatLng _) {
    debugPrint("1111");
    state = state.copyWith(selectedIndex: -1, screenCoordinate: null);
    debugPrint("${state.selectedIndex}");
  }

  /// Called when marker i is tapped
  Future<void> onMarkerTap(int index) async {
    final place = state.places[index];
    final pos = LatLng(place.coordinates?.lat??0, place.coordinates?.lng??0);
    final screen = await _googleMapController.getScreenCoordinate(pos);
    state = state.copyWith(
      selectedIndex: index,
      screenCoordinate: screen,
    );
  }
}