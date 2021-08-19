## Run tests
```
flutter drive --driver=test_driver/integration_test_driver.dart --target=integration_test/gherkin_suite_test.dart
```

## Add new tests
If you change any of the feature files you will need to re-generate the tests using the below command
_You might need to run the clean command first if you have just changed feature files_
```
flutter pub run build_runner clean
flutter pub run build_runner build
```

## Debugging
You can debug the tests by adding a breakpoint to line 12 in `integration_test\gherkin_suite_test.dart` and adding the below to your `.vscode\launch.json` file:
```
{
  "name": "Debug integration_test",
  "program": "test_driver/integration_test_driver.dart",
  "cwd": "example_with_integration_test/",
  "request": "launch",
  "type": "dart",
  "args": [
    "--target=integration_test/gherkin_suite_test.dart",
  ],
}
```