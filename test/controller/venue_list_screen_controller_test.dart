// test/venue_list_screen_controller_test.dart

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotel_list_app/model/filter_models.dart';
import 'package:hotel_list_app/screen/venue_list_screen/controller/venue_list_screen_controller.dart';

void main() {
  const _hotelsJsonAsset = 'assets/json/hotels.json';

  // Load up some deterministic test data
  const sampleJson = '''
  {
    "filters": [],
    "items": [
      { "section":"hotel","name":"A","city":"X","type":"t","images":[],"categories":[],"openingHours":{},"accessibleForGuestPass":true,"overviewText":[],"thingsToDo":[],"coordinates":null }
    ]
  }
  ''';

  TestWidgetsFlutterBinding.ensureInitialized();

  late ProviderContainer container;
  late VenueListScreenController ctrl;

  setUp(() {
    // intercept rootBundle.loadString
    ServicesBinding.instance.defaultBinaryMessenger
        .setMockMessageHandler('flutter/assets', (message) async {
      final key = const StringCodec().decodeMessage(message)!;
      if (key == _hotelsJsonAsset) {
        return const StringCodec().encodeMessage(sampleJson);
      }
      return null;
    });

    container = ProviderContainer();
    ctrl = container.read(venueListScreenControllerProvider.notifier);
  });

  tearDown(() {
    container.dispose();
  });

  test('build() starts with default state', () {
    final state = container.read(venueListScreenControllerProvider);
    expect(state.selectedChip, 0);
    expect(state.showFab, isTrue);
    expect(state.venues, isNull);
    expect(state.fullItemsList, isNull);
  });

  test('changeChip updates selectedChip and does not load venues for out‑of‑range', () {
    ctrl.changeChip(42);
    expect(container.read(venueListScreenControllerProvider).selectedChip, 42);
    // since 42 ≠ 0|1, getVenuesByChoiceChip should do nothing
    expect(container.read(venueListScreenControllerProvider).venues, isNull);
  });

  test('getVenuesByChoiceChip loads hotels.json on index 0', () async {
    // kick off the async load
    final future = ctrl.getVenuesByChoiceChip(index: 0);
    // since there's an artificial 3s delay, we can speed it up:
    await Future.delayed(const Duration(milliseconds: 10));
    // wait for it to finish
    await future;

    final state = container.read(venueListScreenControllerProvider);
    // should have loaded our sample JSON
    expect(state.venues, isNotNull);
    final data = state.venues!.value!;
    expect(data.items, hasLength(1));
    expect(data.items?.first.name, 'A');
    expect(state.fullItemsList, data.items);
  });

  test('applyFilter replaces venues with only the items you pass in', () {
    // seed the controller first
    ctrl.applyFilter(filteredItems: []);
    var state = container.read(venueListScreenControllerProvider);
    expect(state.venues!.value!.items, isEmpty);

    final dummy = [
      Item(
        section: 'foo',
        name: 'bar',
        city: 'baz',
        type: 't',
        images: [],
        categories: [],
        openingHours: {},
        accessibleForGuestPass: false,
        overviewText: [],
        thingsToDo: [],
        coordinates: null,
      )
    ];
    ctrl.applyFilter(filteredItems: dummy);
    state = container.read(venueListScreenControllerProvider);
    expect(state.venues!.value!.items, dummy);
  });
}
