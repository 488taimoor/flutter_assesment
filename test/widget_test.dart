import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_assessment/app/app.dart';

void main() {
  testWidgets('App renders successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const FitnessApp());
    expect(find.text('Fitness Tracker'), findsNothing);
  });
}
