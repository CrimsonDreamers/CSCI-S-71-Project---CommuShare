// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:commushare_front/model/item.dart';
import 'package:commushare_front/service/database.dart';
import 'package:commushare_front/views/home.dart';
import 'package:commushare_front/views/loaning_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:commushare_front/main.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'widget_test.mocks.dart';

@GenerateMocks([DatabaseService])
void main() async {
  final mockDatabaseService = MockDatabaseService();

  // Set up the mock behavior
  final mockItems = [
    Item(id: "1", name: "Test Item 1"),
    Item(id: "2", name: "Test Item 2")
  ];
  when(mockDatabaseService.getItems()).thenAnswer((_) async => mockItems);

  testWidgets('Unit test builds', (WidgetTester tester) async {
    // Make sure the Unit test builds
    expect(true, true);
    expect(42, 6 * 7);
  });

  testWidgets('App builds', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(
      databaseService: mockDatabaseService,
    ));
  });

  testWidgets('A Card appears in the middle of the screen',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(
      databaseService: mockDatabaseService,
    ));

    // Allows the future to complete
    await tester.pump();

    // Verify that a Card appears
    expect(find.byWidgetPredicate((Widget widget) => widget is Card),
        findsAtLeast(1));
  });

  testWidgets('Borrow Widget Button', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(
      databaseService: mockDatabaseService,
    ));

    // Allows the future to complete
    await tester.pump();

    // Verify that one widget for signing up appears on the screen
    expect(find.text('Borrow it'), findsAtLeast(1));
  });

  testWidgets('Able to click on a Button', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(
      databaseService: mockDatabaseService,
    ));

    // Allows the future to complete
    await tester.pump();

    expect(find.byKey(const Key("Borrow it")), findsAtLeast(1));
    await tester.tap(find
        .byWidget(find.byKey(const Key("Borrow it")).evaluate().first.widget));
    await tester.pump();
  });

  testWidgets('Ability to access Sign in page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(
      databaseService: mockDatabaseService,
    ));

    expect(find.byKey(const Key("Go to Sign In")), findsOneWidget);
    await tester.tap(find.byKey(const Key("Go to Sign In")));
    await tester.pump();
  });

  testWidgets('FormFields appears in the middle of the Login Page',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(
      databaseService: mockDatabaseService,
    ));

    // Go to Sign in page
    await tester.tap(find.byKey(const Key("Go to Sign In")));
    // Wait for the navigation to complete
    await tester.pumpAndSettle();

    // Verify that two form fields appear (Email, Password)
    expect(find.byWidgetPredicate((Widget widget) => widget is FormField),
        findsExactly(2));
  });

  testWidgets('Sign in Confirm button exists and is clickable',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(
      databaseService: mockDatabaseService,
    ));

    // Go to Sign in page
    await tester.tap(find.byKey(const Key("Go to Sign In")));
    // Wait for the navigation to complete
    await tester.pumpAndSettle();

    expect(find.byKey(const Key("Confirm Sign in")), findsOneWidget);

    await tester.tap(find.byKey(const Key("Confirm Sign in")));
    await tester.pump();
  });

  testWidgets('Switch to Sign up Page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(
      databaseService: mockDatabaseService,
    ));

    // Go to Sign in page
    await tester.tap(find.byKey(const Key("Go to Sign In")));
    // Wait for the navigation to complete
    await tester.pumpAndSettle();

    // Verify that one widget for signing up appears on the screen
    expect(find.text('Sign up'), findsOneWidget);
    //Verify that a button exist and click on it
    expect(find.byKey(const Key("Sign up")), findsOneWidget);
    await tester.tap(find.byKey(const Key("Sign up")));
    await tester.pump();

    // Verify that the state changed and that we are now on the sign up page
    expect(find.text('Sign up'), findsNothing);
    expect(find.text('Sign in'), findsOneWidget);
  });

  testWidgets('Switch to Sign up - Card updates', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(
      databaseService: mockDatabaseService,
    ));

    // Go to Sign in page
    await tester.tap(find.byKey(const Key("Go to Sign In")));
    // Wait for the navigation to complete
    await tester.pumpAndSettle();

    // Verify that two form fields appear (Email, Password)
    expect(find.byWidgetPredicate((Widget widget) => widget is FormField),
        findsExactly(2));

    await tester.tap(find.byKey(const Key("Sign up")));
    await tester.pump();

    // Verify that the state changed and that we are now on the sign up page
    expect(find.byWidgetPredicate((Widget widget) => widget is FormField),
        findsAtLeast(3));
  });

  testWidgets('FormFields change the states of predefined variables',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(
      databaseService: mockDatabaseService,
    ));

    // Go to Sign in page
    await tester.tap(find.byKey(const Key("Go to Sign In")));
    // Wait for the navigation to complete
    await tester.pumpAndSettle();

    //Go to the Register Page
    await tester.tap(find.byKey(const Key("Sign up")));
    await tester.pump();

    expect(find.text("Welcome !"), findsOneWidget);

    expect(find.byKey(const Key("Name Text Field")), findsOne);
    await tester.enterText(find.byKey(const Key("Name Text Field")), "Joe");
    await tester.pump();

    expect(find.text("Welcome Joe!"), findsOneWidget);
  });

  testWidgets('Can\'t sign in without entering data',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(
      databaseService: mockDatabaseService,
    ));

    // Go to Sign in page
    await tester.tap(find.byKey(const Key("Go to Sign In")));
    // Wait for the navigation to complete
    await tester.pumpAndSettle();

    expect(find.text("Error"), findsNothing);

    expect(find.byKey(const Key("Confirm Sign in")), findsOne);
    await tester.tap(find.byKey(const Key("Confirm Sign in")));
    await tester.pump();

    expect(find.text("Error"), findsOne);
  });

  testWidgets('I must enter valid mail address otherwise an alert is triggered',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(
      databaseService: mockDatabaseService,
    ));

    // Go to Sign in page
    await tester.tap(find.byKey(const Key("Go to Sign In")));
    // Wait for the navigation to complete
    await tester.pumpAndSettle();

    expect(find.text("Error"), findsNothing);
    expect(find.byKey(const Key("Mail Address Text Field")), findsOne);
    await tester.enterText(
        find.byKey(const Key("Mail Address Text Field")), "tommmm.gmail.com");
    await tester.pump();

    await tester.tap(find.byKey(const Key("Confirm Sign in")));
    await tester.pump();

    expect(find.text("Error"), findsOne);
  });
}
