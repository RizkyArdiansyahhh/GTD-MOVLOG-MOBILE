import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gtd_mobile_app/core/theme/app_theme.dart';
import 'package:gtd_mobile_app/features/auth/presentation/screens/splash_screen.dart';

Widget _wrapWithApp(Widget widget) {
  return ProviderScope(
    child: MaterialApp(
      theme: AppTheme.lightTheme,
      home: widget,
    ),
  );
}

void main() {
  testWidgets('SplashScreen renders brand title and logo without overflow',
      (WidgetTester tester) async {
    await tester.pumpWidget(_wrapWithApp(const SplashScreen()));

    expect(find.text('GTD LOGISTICS'), findsOneWidget);
    expect(find.text('ENTERPRISE LOGISTICS CLIENT'), findsOneWidget);
    expect(find.byIcon(Icons.local_shipping_rounded), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
