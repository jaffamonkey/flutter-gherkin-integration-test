## Run tests
```
flutter drive --driver=test_driver/integration_test_driver.dart --target=integration_test/gherkin_suite_test.dart
```

## Add new tests
After adding feature and step codem run this command, which will rebuild the `gherkin_suite_test.g.dart` file, adding the additional steps.
```
flutter pub run build_runner build
```
