import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_list_app/core/theme/app_colors.dart';
import 'package:hotel_list_app/screen/venue_details_screen/venue_details.dart'; // if AppColors is defined here

void main() {
  group('VenuDetailsTitle Widget Test', () {
    testWidgets('renders name and location with correct styles',
            (WidgetTester tester) async {
          const name = 'Atlantis Resort';
          const location = 'Dubai, UAE';

          await tester.pumpWidget(
            MaterialApp(
              theme: ThemeData(
                textTheme: TextTheme(
                  bodyLarge: TextStyle(fontSize: 20),
                  bodySmall: TextStyle(fontSize: 14, color: AppColors.accent),
                ),
              ),
              home: Scaffold(
                body: VenuDetailsTitle(
                  name: name,
                  location: location,
                ),
              ),
            ),
          );

          expect(find.text(name), findsOneWidget);
          expect(find.text(location), findsOneWidget);

          final locationText = tester.widget<Text>(find.text(location));
          expect(locationText.style?.color, AppColors.accent);
        });
  });
}

