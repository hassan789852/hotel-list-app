import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hotel_list_app/model/filter_models.dart';
import 'package:hotel_list_app/screen/venue_list_screen/controller/venue_list_screen_controller.dart';
import 'package:hotel_list_app/screen/venue_list_screen_filter/controller/venue_list_filter_controller.dart';

void main() {
  late ProviderContainer container;
  late FilterResponse gymsResponse;

  setUp(() {
    // Load gyms.json from test/fixtures
    final raw = File('test/fixtures/gyms.json').readAsStringSync();
    gymsResponse = FilterResponse.fromJson(jsonDecode(raw));

    // Set up Riverpod container
    container = ProviderContainer();

    // Prime the VenueListScreenController state
    final venueNotifier =
    container.read(venueListScreenControllerProvider.notifier);
    venueNotifier.state = VenueListScreenState(
      gridController: ScrollController(),
      selectedCategoies: [],
      venues: AsyncValue.data(gymsResponse),
      fullItemsList: gymsResponse.items,
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('initial filter controller state matches venue list screen state', () {
    final filterState = container.read(venueListFilterControllerProvider);

    expect(filterState.fullResponse, isNotNull);
    expect(filterState.fullResponse!.items, isNotEmpty);
    expect(filterState.filteredItems, equals(filterState.fullList));
    expect(filterState.categoriesIdsList, isEmpty);
  });

  test('tapping a category updates filteredItems and categoriesIdsList', () {
    final filterNotifier =
    container.read(venueListFilterControllerProvider.notifier);

    // Select first category from first filter group
    final filterIndex = 0;
    final categoryIndex = 0;

    final categoryId = gymsResponse.filters[filterIndex].categories[categoryIndex].id;

    // Simulate user tap
    filterNotifier.onFilterChipTapV2(
      filterIndex: filterIndex,
      categoryIndex: categoryIndex,
    );

    final updated = container.read(venueListFilterControllerProvider);

    // That category ID should now be selected
    expect(updated.categoriesIdsList, contains(categoryId));

    // Every filtered item should include that category ID
    for (final item in updated.filteredItems) {
      final hasCategory = item.categories.any((c) => c.id == categoryId);
      expect(hasCategory, isTrue, reason: 'Item ${item.name} is missing $categoryId');
    }
  });
}
