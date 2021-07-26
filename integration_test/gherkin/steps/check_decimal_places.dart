import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

final thenICheckDecimalPlaces = then1<String, FlutterWorld>(
  'the {string} value has two decimal places',
  (balance, context) async {
    final getBalance =
        await context.world.appDriver.getText(find.bySemanticsLabel('Balance'));
    final trimmedGetBalance = getBalance!.replaceAll(RegExp('£'), '');
    expect(context.configuration.timeout, isNotNull);
    expect(context.configuration.timeout!.inSeconds, 5);
    context.expectMatch(
        RegExp(r'\d+\.\d\d(?!\d)').hasMatch(trimmedGetBalance), true);
  },
  configuration: StepDefinitionConfiguration()
    ..timeout = const Duration(seconds: 3),
);
