import 'package:commushare_front/main.dart';
import 'package:commushare_front/model/item.dart';
import 'package:flutter/widgets.dart';
import 'package:mockito/mockito.dart' as mockito;
import 'package:flutter_driver/driver_extension.dart';

import 'widget_test.mocks.dart';

void main() {
  final mockDatabaseService = MockDatabaseService();

  // Set up the mock behavior
  final mockItems = [
    Item(id: "1", name: "Test Item 1"),
    Item(id: "2", name: "Test Item 2", owner: "owner_name")
  ];
  mockito.when(mockDatabaseService.getItems()).thenAnswer((_) async => mockItems);


  // Build our app and trigger a frame.
  enableFlutterDriverExtension();
  runApp(MyApp(
    databaseService: mockDatabaseService,
  ));
}