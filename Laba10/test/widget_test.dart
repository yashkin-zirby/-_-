// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:laba10/auth/register_page.dart';
import 'package:laba10/firebase_options.dart';
import 'package:laba10/telegram_messenger.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import '../lib/auth/login_page.dart';
import '../lib/firestore/db_worker.dart';
import '../lib/main.dart';
import 'widget_test.mocks.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {

}
@GenerateMocks([TelegramMessenger])
void main() async {
  group("Unit Tests", () {
    test("test telegram messenger class", () async {
      var messenger = MockTelegramMessenger();
      when(messenger.readChat()).thenAnswer((_) => []);
      expect(messenger.readChat(), isA<List<String>>());
    });
  });
  group("Main Page Tests", () {
    late NavigatorObserver mockObserver;
    setUp(() {
      mockObserver = MockNavigatorObserver();
    });
    Future<void> _buildMainPage(WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
    }

    Future<void> _navigateToLoginPage(WidgetTester tester) async {
      await tester.tap(find.byKey(RegisterPageState.goToLoginLink));
      await tester.pumpAndSettle();
    }
    testWidgets(
        'Check app starts from register page', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      expect(find.widgetWithText(Container, 'Login Page'), findsNothing);
      expect(find.widgetWithText(Container, 'Register Page'), findsOneWidget);
    });
    testWidgets(
        'check navigate to login page from register',
            (WidgetTester tester) async {
          await _buildMainPage(tester);
          await _navigateToLoginPage(tester);
          expect(find.widgetWithText(Container,'Login Page'), findsOneWidget);
          expect(find.widgetWithText(Container,'Register Page'), findsNothing);
        }
    );
  });
}