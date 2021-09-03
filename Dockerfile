FROM ubuntu:18.04

# Prerequisites
RUN apt update && apt install -y curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget

# Setup new user
RUN useradd -ms /bin/bash developer
USER developer
WORKDIR /home/developer

# Prepare Android directories and system variables
RUN mkdir -p Android/Sdk
ENV ANDROID_SDK_ROOT /home/developer/Android/Sdk
RUN mkdir -p .android && touch .android/repositories.cfg

# Setup Android SDK
RUN wget -O sdk-tools.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
RUN unzip sdk-tools.zip && rm sdk-tools.zip
RUN mv tools Android/Sdk/tools
RUN cd Android/Sdk/tools/bin && yes | ./sdkmanager --licenses
RUN cd Android/Sdk/tools/bin && ./sdkmanager "system-images;android-29;google_apis;x86"

# Download Flutter SDK
RUN git clone https://github.com/flutter/flutter.git
ENV PATH "$PATH:/home/developer/flutter/bin"
RUN cd Android/Sdk/tools/bin && yes | ./sdkmanager --licenses
# Run basic check to download Dark SDK
RUN flutter doctor

RUN cd Android/Sdk/tools/bin && echo "no" | ./avdmanager --verbose create avd --force --name "generic_10" --package "system-images;android-29;default;x86" --tag "default" --abi "x86"
RUN cd Android/Sdk/tools/bin && ./emulator TestAVD &

RUN git clone https://github.com/jaffamonkey/flutter-gherkin-integration-test.git

RUN cd flutter-gherkin-integration-test
RUN flutter pub get
RUN flutter drive --driver=test_driver/integration_test_driver.dart --target=integration_test/gherkin_suite_test.dart
