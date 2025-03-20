import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Login button tap', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(MaterialApp(
      home: ElevatedButton(
        onPressed: () {},
        child: const Text('Login'),
      ),
    ));

    // Tap the button
    await tester.tap(find.text('Login'));
    await tester.pump();

    // Verify the expected outcome
    expect(find.text('Login'), findsOneWidget);
  });
}