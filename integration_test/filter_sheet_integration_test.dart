import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Launch your real app
import 'package:hotel_list_app/main.dart' as app;

// We need the filter screen so we can assert on its contents:

void main() {
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();

      testWidgets('Filter sheet end‑to‑end: open sheet, select chip',
              (WidgetTester tester) async {
                // 1) Start the app
                app.main();
                await tester.pumpAndSettle();

                // 2) Tap the “Filter” button (an InkWell showing Text("Filter"))
                final filterButton = find.text('Filter');
                expect(filterButton, findsOneWidget);
                await tester.tap(filterButton);
                await tester.pumpAndSettle();

                // 3) Confirm the bottom sheet is visible by its header
                expect(find.text('Venue type'), findsOneWidget);

                // 4) Tap the “Hotel” chip label
                final hotelLabel = find.text('Hotel').first;
                expect(hotelLabel, findsOneWidget);
                await tester.tap(hotelLabel);
                await tester.pumpAndSettle();

                // 5) Now locate the ChoiceChip ancestor of that Text
                final hotelChip = find.ancestor(
                      of: hotelLabel,
                      matching: find.byType(ChoiceChip),
                );
                expect(hotelChip, findsOneWidget,
                    reason: 'There should be exactly one ChoiceChip for "Hotel"');

                // 6) Read its widget and assert it’s now selected
                final chipWidget = tester.widget<ChoiceChip>(hotelChip);
                expect(chipWidget.selected, isTrue,
                    reason: 'Tapping the Hotel chip should mark it selected');
          });
}
