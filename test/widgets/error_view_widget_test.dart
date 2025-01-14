import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/widgets/error_view_widget.dart';

void main() {
  group("ErrorViewWidget", () {
    testWidgets(
      "Displays error message and Retry button",
      (WidgetTester tester) async {
        // Mocking
        const errorMessage = "Something went wrong!";

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ErrorViewWidget(
                errorMessage: errorMessage,
                onRetry: () {},
              ),
            ),
          ),
        );

        // Asset
        expect(find.text(errorMessage), findsOneWidget);
        expect(find.text("Retry"), findsOneWidget);
        expect(find.byType(ElevatedButton), findsOneWidget);
      },
    );

    testWidgets(
      'Calls onRetry when Retry button is tapped',
      (WidgetTester tester) async {
        // Mocking
        var retryButtonTapped = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ErrorViewWidget(
                errorMessage: "Something went wrong!",
                onRetry: () {
                  retryButtonTapped = true;
                },
              ),
            ),
          ),
        );

        // Act
        await tester.tap(find.text("Retry"));
        await tester.pumpAndSettle();

        // Assert
        expect(retryButtonTapped, isTrue);
      },
    );
  });
}
