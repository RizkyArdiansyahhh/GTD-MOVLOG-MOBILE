import 'package:flutter_test/flutter_test.dart';
import 'package:gtd_mobile_app/main.dart';

void main() {
  testWidgets('App initialization smoke test', (WidgetTester tester) async {
    // Build root app and trigger initial frame.
    await tester.pumpWidget(const GTDLogisticsApp());
    await tester.pump();

    // Verify initial splash screen renders GTD LOGISTICS logo title
    expect(find.text('GTD LOGISTICS'), findsOneWidget);
    expect(find.text('ENTERPRISE LOGISTICS CLIENT'), findsOneWidget);
  });
}
