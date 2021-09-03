#!/bin/bash

echo 'BITBAR IOS APP TEST SHELL SCRIPT'
echo 'Extracting tests.zip...'
yes | unzip tests.zip

mv application.ipa application.zip

unzip application.zip

mv Payload/Runner.app Runner.app

# make sure build folder exists
mkdir -p flutter-gherkin-integration-test/build/ios/iphoneos

# move app to build folder
mv Runner.app flutter-gherkin-integration-test/build/ios/iphoneos/Runner.app

echo 'starting flutter doctor ...'
flutter-2.2.0 doctor

flutter-2.2.0 devices

cd flutter-gherkin-integration-test

# Install flutter packages
flutter-2.2.0 pub get

flutter-2.2.0 drive -v --use-application-binary build/ios/iphoneos/Runner.app --driver=test_driver/integration_test_driver.dart --target=integration_test/gherkin_suite_test.dart