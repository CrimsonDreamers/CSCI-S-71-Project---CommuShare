import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'steps/search_by_owner_step.dart';


Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [RegExp(r'test_driver/features/.*\.feature')]
    ..stepDefinitions = [
      givenTheAppAndItems(),
      WhenSearchingOwner(),
      ThenOnlyOneItemAppears()
    ]
    ..reporters = [ProgressReporter()]
    ..restartAppBetweenScenarios = true
    ..targetAppPath = 'test_driver/app.dart';

  return GherkinRunner().execute(config);
}
