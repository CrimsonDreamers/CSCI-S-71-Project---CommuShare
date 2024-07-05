// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

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

  


}
