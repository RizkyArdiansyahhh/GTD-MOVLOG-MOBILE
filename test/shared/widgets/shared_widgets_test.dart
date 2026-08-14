import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gtd_mobile_app/core/theme/app_theme.dart';
import 'package:gtd_mobile_app/shared/widgets/gtd_button.dart';
import 'package:gtd_mobile_app/shared/widgets/gtd_card.dart';
import 'package:gtd_mobile_app/shared/widgets/gtd_empty_state.dart';
import 'package:gtd_mobile_app/shared/widgets/gtd_error_state.dart';
import 'package:gtd_mobile_app/shared/widgets/gtd_loading.dart';
import 'package:gtd_mobile_app/shared/widgets/gtd_status_badge.dart';
import 'package:gtd_mobile_app/shared/widgets/gtd_text_field.dart';

Widget _wrapWithMaterial(Widget widget) {
  return MaterialApp(
    theme: AppTheme.lightTheme,
    home: Scaffold(
      body: SingleChildScrollView(
        child: widget,
      ),
    ),
  );
}

void main() {
  group('GtdButton Widget Tests', () {
    testWidgets('Renders label and responds to tap', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(_wrapWithMaterial(
        GtdButton(
          label: 'Test Button',
          onPressed: () => tapped = true,
        ),
      ));

      expect(find.text('Test Button'), findsOneWidget);

      await tester.tap(find.text('Test Button'));
      expect(tapped, isTrue);
    });

    testWidgets('Renders loading indicator when isLoading is true', (WidgetTester tester) async {
      await tester.pumpWidget(_wrapWithMaterial(
        GtdButton(
          label: 'Test Button',
          onPressed: () {},
          isLoading: true,
        ),
      ));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Test Button'), findsNothing);
    });

    testWidgets('Disables interaction when onPressed is null', (WidgetTester tester) async {
      await tester.pumpWidget(_wrapWithMaterial(
        const GtdButton(
          label: 'Disabled Button',
          onPressed: null,
        ),
      ));

      expect(find.text('Disabled Button'), findsOneWidget);
    });

    testWidgets('Renders outline and text variants', (WidgetTester tester) async {
      await tester.pumpWidget(_wrapWithMaterial(
        Column(
          children: [
            GtdButton(
              label: 'Outline',
              variant: GtdButtonVariant.outline,
              onPressed: () {},
            ),
            GtdButton(
              label: 'Text',
              variant: GtdButtonVariant.text,
              onPressed: () {},
            ),
          ],
        ),
      ));

      expect(find.text('Outline'), findsOneWidget);
      expect(find.text('Text'), findsOneWidget);
    });
  });

  group('GtdTextField Widget Tests', () {
    testWidgets('Renders label, hint, and accepts input text', (WidgetTester tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(_wrapWithMaterial(
        GtdTextField(
          label: 'Username',
          hint: 'Enter your username',
          controller: controller,
        ),
      ));

      expect(find.text('Username'), findsOneWidget);
      expect(find.text('Enter your username'), findsOneWidget);

      await tester.enterText(find.byType(TextFormField), 'john_doe');
      expect(controller.text, equals('john_doe'));
    });
  });

  group('GtdCard Widget Tests', () {
    testWidgets('Renders child widget and triggers onTap', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(_wrapWithMaterial(
        GtdCard(
          onTap: () => tapped = true,
          child: const Text('Card Content'),
        ),
      ));

      expect(find.text('Card Content'), findsOneWidget);

      await tester.tap(find.text('Card Content'));
      expect(tapped, isTrue);
    });
  });

  group('GtdStatusBadge Widget Tests', () {
    testWidgets('Renders formatted status badges correctly', (WidgetTester tester) async {
      await tester.pumpWidget(_wrapWithMaterial(
        const Column(
          children: [
            GtdStatusBadge(status: 'pending'),
            GtdStatusBadge(status: 'in_transit'),
            GtdStatusBadge(status: 'delivered'),
          ],
        ),
      ));

      expect(find.text('Pending'), findsOneWidget);
      expect(find.text('In Transit'), findsOneWidget);
      expect(find.text('Delivered'), findsOneWidget);
    });
  });

  group('GtdLoading Widget Tests', () {
    testWidgets('Renders progress indicator and message', (WidgetTester tester) async {
      await tester.pumpWidget(_wrapWithMaterial(
        const GtdLoading(message: 'Loading shipments...'),
      ));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Loading shipments...'), findsOneWidget);
    });
  });

  group('GtdEmptyState Widget Tests', () {
    testWidgets('Renders title, description, and action button', (WidgetTester tester) async {
      bool actionTriggered = false;

      await tester.pumpWidget(_wrapWithMaterial(
        GtdEmptyState(
          title: 'No shipments found',
          description: 'There are currently no shipments to display.',
          actionLabel: 'Refresh',
          onAction: () => actionTriggered = true,
        ),
      ));

      expect(find.text('No shipments found'), findsOneWidget);
      expect(find.text('There are currently no shipments to display.'), findsOneWidget);
      expect(find.text('Refresh'), findsOneWidget);

      await tester.tap(find.text('Refresh'));
      expect(actionTriggered, isTrue);
    });
  });

  group('GtdErrorState Widget Tests', () {
    testWidgets('Renders title, error message, and retry button', (WidgetTester tester) async {
      bool retried = false;

      await tester.pumpWidget(_wrapWithMaterial(
        GtdErrorState(
          title: 'Connection Error',
          message: 'Unable to reach backend server.',
          onRetry: () => retried = true,
        ),
      ));

      expect(find.text('Connection Error'), findsOneWidget);
      expect(find.text('Unable to reach backend server.'), findsOneWidget);
      expect(find.text('Try Again'), findsOneWidget);

      await tester.tap(find.text('Try Again'));
      expect(retried, isTrue);
    });
  });
}
