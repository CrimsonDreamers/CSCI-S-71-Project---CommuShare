// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:commushare_front/model/availability.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:commushare_front/model/item.dart';



void main() {
  test('Test create blank item', () {
    final testItem = Item(id: "test_id", name: "test_name");
    expect(testItem.id, "test_id");
    expect(testItem.name, "test_name");
  });


  test('Test list of items', () {
    final testItem = Item(id: "test_id", name: "test_name");
    final testItem2 = Item(id: "test_id_2", name: "test_name_2");

    var listItems = [testItem, testItem2];
    
    expect(listItems.length, 2);
    expect(listItems.first, testItem);
    expect(listItems.last, testItem2);

  });

  test('Test status of item exist', () {
    final testItem = Item(id: "test_id", name: "test_name");
    
    var availability = testItem.availability;
    expect(availability, isNotNull);
  });

  test('Test type and default of availability of item', () {
    final testItem = Item(id: "test_id", name: "test_name");
    
    var availability = testItem.availability;
    expect(availability, const Availability(available: true));
  });

  test('Test there is a default location with an item', () {
    final testItem = Item(id: "test_id", name: "test_name");
    expect(testItem.location, isNotNull);
    expect(testItem.location, "Harvard Yard");
  });

  test('Test can be a set location with an item', () {
    final testItem = Item(id: "test_id", name: "test_name", location: "test_location");
    expect(testItem.location, isNotNull);
    expect(testItem.location, "test_location");
  });

  test('Test there is a default owner name with an item', () {
    final testItem = Item(id: "test_id", name: "test_name");
    expect(testItem.owner, isNotNull);
    expect(testItem.owner, "Harvard University");
  });

  test('Test can be a set owner name with an item', () {
    final testItem = Item(id: "test_id", name: "test_name", owner: "test_owner");
    expect(testItem.owner, isNotNull);
    expect(testItem.owner, "test_owner");
  });

  test('Test an item can have a borrower name', () {
    final testItem = Item(id: "test_id", name: "test_name", owner: "test_owner", availability: const Availability(available: false, borrower: "borrower_name"));
    expect(testItem.availability.borrower, isNotNull);
    expect(testItem.availability.borrower, "borrower_name");
  });

}
