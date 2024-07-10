
// ignore_for_file: non_constant_identifier_names

//import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_driver/src/common/find.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';

StepDefinitionGeneric givenTheAppAndItems() {
  return given<FlutterWorld>(
    'the app and the items',
    (context) async {
      await FlutterDriverUtils.waitForFlutter(context.world.driver);
    },
  );
}

StepDefinitionGeneric WhenSearchingOwner() {
  return when<FlutterWorld>(
    'searching for the owner named Daniel',
    (context) async {
      //context.expectMatch(actualCount, count);
    await FlutterDriverUtils.enterText(context.world.driver,find.byKey(const Key("Search")) as SerializableFinder, "Daniel");
    },
  );
}

StepDefinitionGeneric ThenOnlyOneItemAppears() {
  return then<FlutterWorld>(
    'only one item should appear in the list',
    (context) async {
    // On the mock database, only one item got owner_name as owner, so only one item appears
    context.expect(find.byKey(const Key("Item")), findsOne);
    },
  );
}