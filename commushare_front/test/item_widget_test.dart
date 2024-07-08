// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:commushare_front/model/availability.dart';
import 'package:commushare_front/views/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:commushare_front/model/item.dart';

import 'widget_test.mocks.dart';



void main() {
  final testItem = Item(id: "test_id", name: "test_name");
  final mockDatabaseService = MockDatabaseService();

  testWidgets('item widget build properly',
      (WidgetTester tester) async {
    // Show one item
    await tester.pumpWidget(ItemWidget(item: testItem, databaseService: mockDatabaseService,));
  });

  testWidgets('test borrow button exists',
      (WidgetTester tester) async {
    // Show one item
    await tester.pumpWidget(ItemWidget(item: testItem, databaseService: mockDatabaseService,));
    
    expect(find.text("Borrow it"), findsOneWidget);
  });

  testWidgets('borrow button clickable',
      (WidgetTester tester) async {
    // Show one item
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: ItemWidget(item: testItem, databaseService: mockDatabaseService,))));
    await tester.tap(find.byKey(const Key("Borrow it")));
  
  });

  testWidgets('Window appears after clicking borrow',
      (WidgetTester tester) async {
    // Show one item
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: ItemWidget(item: testItem, databaseService: mockDatabaseService,))));
    await tester.tap(find.text("Borrow it"));

    // Wait for the navigation to complete 
    await tester.pumpAndSettle();

    //expect(find.byWidgetPredicate((Widget widget) => widget is Alert),
     //   findsOneWidget);
     expect(find.byKey(const Key("Alert_Button")), findsOneWidget);
  });

  testWidgets('there is no return button on available items',
      (WidgetTester tester) async {
    // Show one available item
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: ItemWidget(item: testItem, databaseService: mockDatabaseService,))));
    expect(find.byKey(const Key("Return")), findsNothing);
  });

  testWidgets('there is a return button on unavailable items',
      (WidgetTester tester) async {
    final testItemUnavailable = Item(id: "test_id", name: "test_name", availability: const Availability(available: false));

    // Show one unavailable item
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: ItemWidget(item: testItemUnavailable, databaseService: mockDatabaseService,))));
    expect(find.byKey(const Key("Return")), findsOneWidget);
  });
}
