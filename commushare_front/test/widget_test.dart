// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:commushare_front/main.dart';

void main() {
  testWidgets('Unit test builds', (WidgetTester tester) async {
    // Make sure the Unit test builds
    expect(true, true);
    expect(42, 6 * 7);
  });

  testWidgets('App builds', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
  });

  testWidgets('A Card appears in the middle of the screen',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that a Card appears
    expect(find.byWidgetPredicate((Widget widget) => widget is Card),
        findsOneWidget);
  });

  testWidgets('Sign up Widget Button', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    // Verify that one widget for signing up appears on the screen
    expect(find.text('Sign up'), findsOneWidget);
  });

  testWidgets('Able to click on a Button', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    expect(find.byKey(const Key("Sign up")), findsOneWidget);
    await tester.tap(find.byKey(const Key("Sign up")));
    await tester.pump();
  });

  testWidgets('FormFields appears in the middle of the screen',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that two form fields appear (Email, Password)
    expect(find.byWidgetPredicate((Widget widget) => widget is FormField),
        findsExactly(2));
  });

  testWidgets('Sign in Confirm button exists and is clickable',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    expect(find.byKey(const Key("Confirm Sign in")), findsOneWidget);

    await tester.tap(find.byKey(const Key("Confirm Sign in")));
    await tester.pump();
  });

  testWidgets('Switch to Sign up Page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

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
    await tester.pumpWidget(const MyApp());

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
    await tester.pumpWidget(const MyApp());

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
    await tester.pumpWidget(const MyApp());

    expect(find.text("Error"),
        findsNothing);

    expect(find.byKey(const Key("Confirm Sign in")), findsOne);
    await tester.tap(find.byKey(const Key("Confirm Sign in")));
    await tester.pump();

    expect(find.text("Error"),
        findsOne);
  });

  testWidgets('I must enter valid mail address otherwise an alert is triggered',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

expect(find.text("Error"),
        findsNothing);
    expect(find.byKey(const Key("Mail Address Text Field")), findsOne);
    await tester.enterText(find.byKey(const Key("Mail Address Text Field")), "tommmm.gmail.com");
    await tester.pump();


    await tester.tap(find.byKey(const Key("Confirm Sign in")));
    await tester.pump();

    expect(find.text("Error"),
        findsOne);
  });
}
