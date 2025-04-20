import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Import your actual model and controller
import 'package:hotel_list_app/model/filter_models.dart';
import 'package:hotel_list_app/screen/map_screen/controller/map_controller.dart';

/// A minimal fake just to satisfy the getScreenCoordinate call.
class FakeGoogleMapController extends Fake implements GoogleMapController {
  @override
  Future<ScreenCoordinate> getScreenCoordinate(LatLng _) async {
    // return a constant so we can assert against it
    return const ScreenCoordinate(x: 42, y: 84);
  }
}

void main() {
  test('MapController.onMarkerTap updates selectedIndex & screenCoordinate', () async {
    //  Dummy place list
    final places = [
      Item(
        section: 'hotel',
        name: 'Test Hotel',
        city: 'Nowhere',
        type: 'hotel',
        images: [ImageData(url: 'https://example.com/1.png')],
        categories: [],
        openingHours: {},
        accessibleForGuestPass: true,
        overviewText: [],
        thingsToDo: [],
        coordinates: Coordinates(lat: 10.0, lng: 20.0),
      ),
    ];

    //  Create a ProviderContainer
    final container = ProviderContainer();
    addTearDown(container.dispose);

    //  Wire up controller
    final controller = container.read(mapControllerProvider(places).notifier);
    controller.onMapCreated(FakeGoogleMapController());

    //  Tap marker at index 0
    await controller.onMarkerTap(0);

    //  Read state and assert
    final state = container.read(mapControllerProvider(places));
    expect(state.selectedIndex, 0);
    expect(state.screenCoordinate, const ScreenCoordinate(x: 42, y: 84));
  });
}
