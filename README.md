```
flutter clean && flutter pub get && cd ios/ && pod install
flutter drive --driver=test_driver/integration_test_driver.dart --target=integration_test/gherkin_suite_test.dart
```


git add README.md
git add android/app/build.gradle
git add android/app/src/debug/AndroidManifest.xml
git add android/app/src/main/AndroidManifest.xml
git add android/app/src/main/kotlin/com/example/example_with_integration_test/MainActivity.kt
git add android/app/src/profile/AndroidManifest.xml
git add integration_test/gherkin/configuration.dart
git add integration_test/gherkin/reports/integration_response_data.json
git add integration_test/gherkin/world/custom_world.dart
git add ios/Flutter/Debug.xcconfig
git add ios/Flutter/Release.xcconfig
git add ios/Runner.xcodeproj/project.pbxproj
git add ios/Runner.xcodeproj/project.xcworkspace/contents.xcworkspacedata
git add ios/Runner.xcodeproj/xcshareddata/xcschemes/Runner.xcscheme
git add ios/Runner.xcworkspace/contents.xcworkspacedata
git add ios/Runner/Info.plist
git add lib/blocs/todo_bloc.dart
git add lib/main.dart
git add lib/models/todo_model.dart
git add lib/module.dart
git add lib/repositories/todo_repository.dart
git add lib/services/external_application_manager.dart
git add lib/widgets/components/add_todo_component.dart
git add lib/widgets/views/home_view.dart
git add pubspec.yaml