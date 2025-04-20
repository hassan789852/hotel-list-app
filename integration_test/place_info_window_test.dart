// test/place_info_window_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'package:hotel_list_app/model/filter_models.dart';
import 'package:hotel_list_app/screen/map_screen/widget/place_info_window.dart';

void main() {
  testWidgets('PlaceInfoWindow displays image and title correctly',
          (WidgetTester tester) async {
        // 1) Create a dummy Item matching your real model
        final place = Item(
          section: 'hotel',
          name: 'Test Venue',
          city: 'Test City',
          type: 'hotel',
          images: [ImageData(url: 'https://privilee-media.imgix.net/privilee/Z1FSf5bqstJ98DhE_121_Studio_03.png?auto=format,compress')],
          categories: [],
          openingHours: {},
          accessibleForGuestPass: true,
          overviewText: [],
          thingsToDo: [],
          coordinates: Coordinates(lat: 0.0, lng: 0.0),
        );

        // 2) Wrap the pump in mockNetworkImagesFor to avoid real HTTP
        await mockNetworkImagesFor(() async {
          // Pump the PlaceInfoWindow inside MaterialApp + Scaffold
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: Center(child: PlaceInfoWindow(place: place)),
              ),
            ),
          );
          await tester.pumpAndSettle();
        });

        // 3) Verify the widget tree
        expect(find.text('Test Venue'), findsOneWidget,
            reason: 'The venue name should appear');
        expect(find.byType(Image), findsOneWidget,
            reason: 'An Image widget should be in the tree for the network image');
      });
}
