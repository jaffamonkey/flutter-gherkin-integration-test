// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gherkin_suite_test.dart';

// **************************************************************************
// GherkinSuiteTestGenerator
// **************************************************************************

class _CustomGherkinIntegrationTestRunner extends GherkinIntegrationTestRunner {
  _CustomGherkinIntegrationTestRunner(
    TestConfiguration configuration,
    void Function(World) appMainFunction,
  ) : super(configuration, appMainFunction);

  @override
  void onRun() {
    testFeature0();
    testFeature1();
  }

  void testFeature0() {
    runFeature(
      'Creating todos:',
      <String>['@tag'],
      () async {
        runScenario(
          'User can create a new todo item',
          <String>['@tag', '@tag1', '@tag_two'],
          (TestDependencies dependencies) async {
            await runStep(
              'Given I fill the "todo" field with "Buy carrots"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'When I tap the \'add\' button',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Then I expect the todo list',
              <String>[],
              GherkinTable.fromJson('[{"Todo":"Buy carrots"}]'),
              dependencies,
            );
          },
        );

        runScenario(
          'User can create multiple new todo items',
          <String>['@tag', '@debug'],
          (TestDependencies dependencies) async {
            await runStep(
              'Given I fill the "todo" field with "Buy carrots"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'When I tap the "add" button',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'And I fill the "todo" field with "Buy apples"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'When I tap the "add" button',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'And I fill the "todo" field with "Buy blueberries"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'When I tap the "add" button',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Then I expect the todo list',
              <String>[],
              GherkinTable.fromJson(
                  '[{"Todo":"Buy blueberries"},{"Todo":"Buy apples"},{"Todo":"Buy carrots"}]'),
              dependencies,
            );

            await runStep(
              'Given I wait 5 seconds for the animation to complete',
              <String>[],
              null,
              dependencies,
            );
          },
        );
      },
    );
  }

  void testFeature1() {
    runFeature(
      'Display card balance on account summary screen:',
      <String>['@tag'],
      () async {
        runScenario(
          'User views a positive value as a card balance on the screen',
          <String>['@tag', '@tag1'],
          (TestDependencies dependencies) async {
            await runStep(
              'Given I open the app',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Given I am logged in as \'postive.balance@address.uk\'',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Then I expect the text \'Your balance is\' to be present',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'And the \'Card Balance\' value has two decimal places',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'When I tap the "Personal Loan" link',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Then I expect the text \'Remaining Loan amount\' to be present',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'And the \'Remaining Loan Amount\' value has two decimal places',
              <String>[],
              null,
              dependencies,
            );
          },
        );
      },
    );
  }
}

void executeTestSuite(
  TestConfiguration configuration,
  void Function(World) appMainFunction,
) {
  _CustomGherkinIntegrationTestRunner(configuration, appMainFunction).run();
}
