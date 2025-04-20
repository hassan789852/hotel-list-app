import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_list_app/model/filter_models.dart';
import 'package:hotel_list_app/core/theme/app_colors.dart'; // Update path if needed
import 'package:hotel_list_app/screen/venue_details_screen/venue_details.dart'; // Assuming OverviewText model is defined here

void main() {
  group('VenueDetailsWidget Test', () {
    testWidgets('displays opening hours and overview texts',
            (WidgetTester tester) async {
          const openingHours = '9 AM - 9 PM';
          final overviewTexts = [
            OverviewText(text: 'Family friendly', type: '', spans: []),
            OverviewText(text: 'Infinity pool access', type: '', spans: []),
            OverviewText(text: 'Free parking', type: '', spans: []),
          ];

          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: VenueDetailsWidget(
                  openingHoures: openingHours,
                  overviewText: overviewTexts,
                ),
              ),
            ),
          );

          // Static label
          expect(find.text('Opening hours'), findsOneWidget);

          // Opening hours text
          expect(find.text(openingHours), findsOneWidget);

          // Overview texts
          for (final text in overviewTexts) {
            expect(find.text(text.text), findsOneWidget);
          }
        });

    testWidgets('fallbacks to "Full" when opening hours is empty',
            (WidgetTester tester) async {
          final overviewTexts = [OverviewText(text: 'Test description', type: '', spans: [])];

          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: VenueDetailsWidget(
                  openingHoures: '',
                  overviewText: overviewTexts,
                ),
              ),
            ),
          );

          expect(find.text('Full'), findsOneWidget);
          expect(find.text('Test description'), findsOneWidget);
        });
  });
}
