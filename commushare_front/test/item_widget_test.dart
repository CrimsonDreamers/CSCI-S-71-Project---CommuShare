// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:commushare_front/views/item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:commushare_front/model/item.dart';
import 'package:rflutter_alert/rflutter_alert.dart';



void main() {
final testItem = Item(id: "test_id", name: "test_name");
  testWidgets('item widget build properly',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ItemWidget(item: testItem,));
  });

  testWidgets('test borrow button exists',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ItemWidget(item: testItem,));
    
    expect(find.text("Borrow it"), findsOneWidget);
  });

  testWidgets('borrow button clickable',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: ItemWidget(item: testItem,))));
    await tester.tap(find.byKey(const Key("Borrow it")));
  
  });

  testWidgets('Window appears after clicking borrow',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: ItemWidget(item: testItem,))));
    await tester.tap(find.text("Borrow it"));

    // Wait for the navigation to complete 
    await tester.pumpAndSettle();

    //expect(find.byWidgetPredicate((Widget widget) => widget is Alert),
     //   findsOneWidget);
     expect(find.byKey(new Key("Alert_Button")), findsOneWidget);
  });

  


}
