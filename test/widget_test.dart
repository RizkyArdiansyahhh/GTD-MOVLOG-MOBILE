import 'package:flutter_test/flutter_test.dart';
import 'package:gtd_mobile_app/main.dart';

void main() {
  testWidgets('Foundation app initialization smoke test', (WidgetTester tester) async {
    // Build root app and trigger a frame.
    await tester.pumpWidget(const GTDLogisticsApp());
    await tester.pumpAndSettle();

    // Verify that foundation placeholder displays GTD Logistics title.
    expect(find.text('GTD Logistics'), findsAtLeast(1));
    expect(find.text('Flutter Application Foundation Initialized'), findsOneWidget);
  });
}
