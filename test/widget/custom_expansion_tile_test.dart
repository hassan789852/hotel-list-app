import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_list_app/core/theme/app_colors.dart';
import 'package:hotel_list_app/screen/venue_details_screen/venue_details.dart'; // for color matching

void main() {
  group('CustomExpansionTile Widget Test', () {
    testWidgets('renders title, badge, subtitle, and expands children',
            (WidgetTester tester) async {
          const testTitle = 'Facilities';
          const testBadge = '5';
          const testSubtitle = 'Tap to view more';
          final testChild = Text('Swimming Pool');

          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: CustomExpansionTile(
                  title: testTitle,
                  badge: testBadge,
                  subtitle: testSubtitle,
                  children: [testChild],
                ),
              ),
            ),
          );

          expect(find.text(testTitle), findsOneWidget);
          expect(find.text(testBadge), findsOneWidget);
          expect(find.text(testSubtitle), findsOneWidget);

          // Child should not be visible until expanded
          expect(find.text('Swimming Pool'), findsNothing);

          await tester.tap(find.text(testTitle));
          await tester.pumpAndSettle();

          expect(find.text('Swimming Pool'), findsOneWidget);
        });

    testWidgets('does not show badge or subtitle if empty',
            (WidgetTester tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: CustomExpansionTile(
                  title: 'Info',
                  badge: '',
                  subtitle: '',
                  children: [],
                ),
              ),
            ),
          );

          expect(find.text('Info'), findsOneWidget);
          expect(find.byType(SizedBox), findsWidgets); // Empty badge and subtitle render as SizedBox
        });
  });
}
