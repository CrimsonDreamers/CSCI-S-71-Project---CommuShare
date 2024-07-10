import 'package:commushare_front/main.dart';
import 'package:commushare_front/model/item.dart';
import 'package:flutter/widgets.dart';
import 'package:mockito/mockito.dart' as mockito;
import 'package:gherkin/gherkin.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_driver/driver_extension.dart';

import '../widget_test.mocks.dart';

StepDefinitionGeneric givenTheAppAndItems() {
  return given<FlutterWorld>(
    'the app and the items',
    (context) async {

    },
  );
}