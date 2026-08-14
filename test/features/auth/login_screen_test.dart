import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gtd_mobile_app/core/theme/app_theme.dart';
import 'package:gtd_mobile_app/features/auth/presentation/screens/login_screen.dart';
import 'package:gtd_mobile_app/shared/widgets/gtd_button.dart';
import 'package:gtd_mobile_app/shared/widgets/gtd_text_field.dart';

Widget _wrapWithApp(Widget widget) {
  return ProviderScope(
    child: MaterialApp(
      theme: AppTheme.lightTheme,
      home: widget,
    ),
  );
}

void main() {
  group('LoginScreen Widget Tests', () {
    testWidgets('Renders Login Screen header, input fields, and Sign In button',
        (WidgetTester tester) async {
      await tester.pumpWidget(_wrapWithApp(const LoginScreen()));

      expect(find.text('Welcome Back'), findsOneWidget);
      expect(find.text('Username or Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.byType(GtdTextField), findsNWidgets(2));
      expect(find.byType(GtdButton), findsOneWidget);
      expect(find.text('Sign In'), findsOneWidget);
    });

    testWidgets('Toggles password visibility on suffix icon tap',
        (WidgetTester tester) async {
      await tester.pumpWidget(_wrapWithApp(const LoginScreen()));

      final passwordFinder = find.widgetWithText(GtdTextField, 'Password');
      expect(passwordFinder, findsOneWidget);

      // Verify visibility toggle button exists
      final toggleIcon = find.byTooltip('Show Password');
      expect(toggleIcon, findsOneWidget);

      // Tap toggle icon
      await tester.tap(toggleIcon);
      await tester.pump();

      // Tooltip should now be Hide Password
      expect(find.byTooltip('Hide Password'), findsOneWidget);
    });

    testWidgets('Displays validation error when submitting empty form',
        (WidgetTester tester) async {
      await tester.pumpWidget(_wrapWithApp(const LoginScreen()));

      // Tap Sign In without filling form
      await tester.tap(find.text('Sign In'));
      await tester.pump();

      expect(find.text('Username or Email is required'), findsOneWidget);
      expect(find.text('Password is required'), findsOneWidget);
    });

    testWidgets('Triggers login notifier and displays loading state during submission',
        (WidgetTester tester) async {
      await tester.pumpWidget(_wrapWithApp(const LoginScreen()));

      // Enter credentials
      await tester.enterText(
        find.byType(TextFormField).at(0),
        'driver@gtd.com',
      );
      await tester.enterText(
        find.byType(TextFormField).at(1),
        'password123',
      );

      // Submit form
      await tester.tap(find.text('Sign In'));
      await tester.pump(); // Triggers loading

      // Verify loading indicator is displayed inside button
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      // Wait for mock repository delay (600ms)
      await tester.pump(const Duration(milliseconds: 650));
      await tester.pumpAndSettle();

      // Verify success feedback
      expect(find.text('Login successful! (Simulated UI State)'), findsOneWidget);
    });
  });
}
