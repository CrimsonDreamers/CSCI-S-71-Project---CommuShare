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

  testWidgets('A button for adding items is displayed in the HomePage',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
        home: Home(
      databaseService: mockDatabaseService,
    )));

    expect(find.byKey(const Key("add_Button")), findsOneWidget);
  });

  testWidgets('The adding button is clickable', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(
      databaseService: mockDatabaseService,
    ));

    expect(find.byKey(const Key("add_Button")), findsOneWidget);
    await tester.tap(find.byKey(const Key("add_Button")));
    await tester.pump();
  });

  testWidgets(
      'The adding button is clickable and triggers the loan an item page',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(
      databaseService: mockDatabaseService,
    ));

    expect(find.byKey(const Key("add_Button")), findsOneWidget);
    await tester.tap(find.byKey(const Key("add_Button")));
    await tester.pumpAndSettle();

    // Verify that the appearing view changed and that we are now on the creating item page
    expect(find.byKey(new Key("CreateItemView")),
        findsOneWidget);
  });

  testWidgets('FormFields appears in the loan an item page',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(
      databaseService: mockDatabaseService,
    ));

    expect(find.byKey(const Key("add_Button")), findsOneWidget);
    await tester.tap(find.byKey(const Key("add_Button")));
    await tester.pumpAndSettle();

    // Verify that the appearing view changed and that we are now on the creating item page
    expect(find.byKey(new Key("CreateItemView")),
        findsOneWidget);

    // Verify that two form fields appear (Name, Description)
    expect(find.byWidgetPredicate((Widget widget) => widget is FormField),
        findsExactly(2));
  });

  testWidgets('The loan an item page is clear on its purpose',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(
      databaseService: mockDatabaseService,
    ));

    expect(find.byKey(const Key("add_Button")), findsOneWidget);
    await tester.tap(find.byKey(const Key("add_Button")));
    await tester.pumpAndSettle();

    // Verify that the appearing view changed and that we are now on the creating item page
    expect(find.byKey(new Key("CreateItemView")),
        findsOneWidget);

    // Verify that two form fields appear (Name, Description)
    expect(
        find.text(
            "Which item do you want to make available to the community ?"),
        findsOneWidget);
  });

  testWidgets('A confirm button is displayed', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(
      databaseService: mockDatabaseService,
    ));

    expect(find.byKey(const Key("add_Button")), findsOneWidget);
    await tester.tap(find.byKey(const Key("add_Button")));
    await tester.pumpAndSettle();

    // Verify that the appearing view changed and that we are now on the creating item page
    expect(find.byKey(new Key("CreateItemView")),
        findsOneWidget);

    // Verify that two form fields appear (Name, Description)
    expect(find.byKey(const Key("confirm_loan_Button")), findsOneWidget);
  });
}
