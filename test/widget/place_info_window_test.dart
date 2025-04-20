// test/place_info_window_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'package:hotel_list_app/model/filter_models.dart';
import 'package:hotel_list_app/screen/map_screen/widget/place_info_window.dart';

void main() {
  testWidgets('PlaceInfoWindow displays image and title correctly',
          (WidgetTester tester) async {
        //  Create a dummy Item matching your real model
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

        //  Wrap in mockNetworkImagesFor to intercept Image.network
        await mockNetworkImagesFor(() async {
          // Pump the widget inside a MaterialApp
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: Center(
                  child: PlaceInfoWindow(place: place),
                ),
              ),
            ),
          );
          // Allow one frame for the image to resolve (mocked)
          await tester.pump();
        });

        //  Verify the title text is shown
        expect(find.text('Test Venue'), findsOneWidget);

        //  Verify an Image widget is in the tree
        expect(find.byType(Image), findsOneWidget);
      });
}
