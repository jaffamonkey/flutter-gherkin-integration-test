import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

final iAmLoggedInAs = then1<String, FlutterWorld>(
  'I am logged in as {string}',
  (customerid, context) async {
    final username = find.text('Email address');
    final password = find.text('Password');
    final loginButton = find.text('Continue');
    const timeout = Duration(seconds: 5);
    final sendSms = find.text('Send SMS');
    final smsfield = find.bySemanticsLabel('fieldGestureDetector');
    final passcodefield = find.bySemanticsLabel('fieldGestureDetector');
    await context.world.appDriver.tap(password, timeout: timeout);
    await context.world.appDriver.enterText(password, 'password');
    await context.world.appDriver.tap(username);
    await context.world.appDriver.enterText(username, customerid);
    await context.world.appDriver.tap(password);
    await context.world.appDriver.tap(loginButton, timeout: timeout);
    await context.world.appDriver.tap(sendSms, timeout: timeout);
    await context.world.appDriver.tap(smsfield, timeout: timeout);
    await context.world.appDriver.enterText(smsfield, '232425');
    await context.world.appDriver.tap(passcodefield);
    await context.world.appDriver.enterText(passcodefield, '010170');
    await context.world.appDriver.tap(passcodefield);
    await context.world.appDriver.enterText(passcodefield, '010170');
  },
  configuration: StepDefinitionConfiguration()
    ..timeout = const Duration(seconds: 3),
);
