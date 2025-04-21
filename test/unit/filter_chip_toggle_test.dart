import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotel_list_app/model/filter_models.dart';
import 'package:hotel_list_app/screen/venue_list_screen_filter/controller/venue_list_filter_controller.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('VenueListFilterController - onFilterChipTap()', () {
    late FilterResponse testResponse;

    setUpAll(() async {
      final raw = File('test/fixtures/gyms.json').readAsStringSync();
      testResponse = FilterResponse.fromJson(jsonDecode(raw));

    });

    test('should toggle category selection and update filtered items', () {
      final container = ProviderContainer();

      final controller =
      container.read(venueListFilterControllerProvider.notifier);

      // initialize the controller's state
      controller.state = VenueListFilterState(
        categoriesIdsList: [],
        fullResponse: testResponse,
        fullList: testResponse.items ?? [],
        filteredItems: [],
      );

      final filterIndex = 0;
      final categoryIndex = 0;
      final categoryId = testResponse.filters[filterIndex].categories[categoryIndex].id;

      // Tap to select
      controller.onFilterChipTap(
        filterIndex: filterIndex,
        categoryIndex: categoryIndex,
      );

      expect(
        controller.state.fullResponse!.filters[filterIndex].categories[categoryIndex].selected,
        true,
      );
      expect(controller.state.categoriesIdsList, contains(categoryId));
      expect(controller.state.filteredItems.isNotEmpty, true);

      // Tap to deselect
      controller.onFilterChipTap(
        filterIndex: filterIndex,
        categoryIndex: categoryIndex,
      );

      expect(
        controller.state.fullResponse!.filters[filterIndex].categories[categoryIndex].selected,
        false,
      );
      expect(controller.state.categoriesIdsList, isNot(contains(categoryId)));
    });
  });
}
