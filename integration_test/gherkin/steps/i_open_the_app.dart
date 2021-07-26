import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

final iOpenTheApp = then<FlutterWorld>(
  'I open the app',
  (context) async {
    final exists3 =
        await context.world.appDriver.isPresent(find.text('Register'));
    final exists2 =
        await context.world.appDriver.isPresent(find.text('Sign in'));
    final exists = await context.world.appDriver
        .isPresent(find.text("I'm happy to continue"));
    final passcodelogin = find.bySemanticsLabel('container1');
    final passcodefield = find.bySemanticsLabel('fieldGestureDetector');
    if (exists2) {
      await context.world.appDriver.tap(find.text('Sign in'));
    } else if (exists) {
      await context.world.appDriver.tap(find.text("I'm happy to continue"));
      await context.world.appDriver.tap(find.text('Sign in'));
    } else if (exists3) {
      await context.world.appDriver.tap(find.text('Register'));
    } else {
      for (var i = 0; i < 5; i += 1) {
        await context.world.appDriver.tap(passcodelogin);
        // This is forcing a failed passcode entry, so the 'Register again' button displayed
        // Registering again, is what resets the device
        await context.world.appDriver.enterText(passcodefield, '333333');
      }
      await context.world.appDriver.tap(find.text('Register again'));
    }
  },
  configuration: StepDefinitionConfiguration()
    ..timeout = const Duration(seconds: 3),
);
