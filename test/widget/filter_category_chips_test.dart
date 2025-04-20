// test/filter_category_chips_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_list_app/model/filter_models.dart';
import 'package:hotel_list_app/screen/venue_list_screen_filter/venue_list_filter.dart';

void main() {
  group('FilterCategoryChips', () {
    testWidgets(
      'renders all Category names and invokes callback',
          (WidgetTester tester) async {
        //  Build a dummy FilterGroup with two categories
        final categories = [
          Category(id: 'c1', name: 'Beach', selected: false),
          Category(id: 'c2', name: 'Pool', selected: true),
        ];
        final filterGroup = FilterGroup(
          name: 'Facilities',
          type: 'multi',
          categories: categories,
        );
        var tapped = -1;

        // Pump the widget into the tester
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FilterCategoryChips(
                filter: filterGroup,
                filterIndex: 0,
                onChipTap: (categoryIndex) => tapped = categoryIndex,
              ),
            ),
          ),
        );

        //  Verify both labels show up
        expect(find.text('Beach'), findsOneWidget);
        expect(find.text('Pool'), findsOneWidget);

        // Tap the first chip and verify the callback
        await tester.tap(find.text('Beach'));
        await tester.pumpAndSettle();
        expect(tapped, 0);
      },
    );
  });
}
