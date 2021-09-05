
FROM ubuntu:18.04

# Install java jdk 8
RUN apt-get update && \
	apt-get install -y openjdk-8-jdk && \
	apt-get install -y ant && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
	rm -rf /var/cache/oracle-jdk8-installer

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

# Install dependencies
RUN apt update -y && \
    apt install -y --no-install-recommends \
    bash git wget curl unzip lib32stdc++6 \
    libnotify4 gnupg libxkbfile1 libxkbcommon-x11-0 \
    libgconf-2-4 libsecret-1-0 gnupg2 libglu1 xz-utils \
    gcc-multilib libgtk2.0-0 libx11-xcb-dev \
    libxss-dev libasound2 libnss3 libxtst6 \
    pulseaudio libgl1-mesa-glx libgtkd-3-0 \
    qemu-kvm usbutils \
    cpu-checker android-tools-adb && \
    rm -rf /var/lib/apt/lists/*

# User and Groups
RUN groupadd flutter
RUN usermod -a -G flutter root

ENV DEVELOPER developer
ENV HOME_DIR /home/${DEVELOPER}
RUN useradd -ms /bin/bash ${DEVELOPER}
RUN usermod -a -G flutter ${DEVELOPER}
RUN usermod -a -G plugdev ${DEVELOPER}
RUN usermod -a -G kvm ${DEVELOPER}
RUN adduser ${DEVELOPER} kvm

# Android sdk - properties
ENV ANDROID_VERSION="30"
ENV ANDROID_SDK sdk-tools-linux-4333796.zip
ENV ANDROID_SDK_URL https://dl.google.com/android/repository/${ANDROID_SDK}
ENV ANDROID_HOME /opt/android-sdk

# Create folder and add flutter-group rights
RUN mkdir ${ANDROID_HOME}
RUN chown -R :flutter /opt
RUN chmod -R g+xrw /opt
RUN chown -R :flutter ${ANDROID_HOME}
RUN chmod -R g+xrw ${ANDROID_HOME}
USER ${DEVELOPER}

# Install android sdk
RUN cd /opt && wget -q ${ANDROID_SDK_URL} --show-progress && \
    unzip ${ANDROID_SDK} -d $ANDROID_HOME && rm ${ANDROID_SDK}

# Add android tools and platform tools to PATH
ENV PATH $PATH:$ANDROID_HOME/tools
ENV PATH $PATH:$ANDROID_HOME/platform-tools
ENV PATH $PATH:$ANDROID_HOME/tools/bin

# Install Android Tools
RUN yes | sdkmanager --update --verbose
RUN yes | sdkmanager "platform-tools"
RUN yes | sdkmanager "build-tools;$ANDROID_VERSION.0.2" --verbose
RUN yes | sdkmanager "platforms;android-$ANDROID_VERSION" --verbose
RUN yes | sdkmanager "extras;android;m2repository" --verbose
RUN yes | sdkmanager "extras;google;m2repository" --verbose
RUN yes | sdkmanager "extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.2" --verbose
RUN yes | sdkmanager "extras;m2repository;com;android;support;constraint;constraint-layout;1.0.2" --verbose
RUN yes | sdkmanager "system-images;android-30;google_apis_playstore;x86" --verbose
RUN yes | sdkmanager --licenses

# Create fake keymap file
RUN mkdir $ANDROID_HOME/tools/keymaps && \
    touch $ANDROID_HOME/tools/keymaps/de-de

# Install flutters stable
ENV FLUTTER_HOME /opt/flutter
RUN git clone https://github.com/flutter/flutter.git -b stable --depth 1 $FLUTTER_HOME
ENV PATH=$FLUTTER_HOME/bin:$PATH
RUN flutter channel stable

RUN adb start-server
RUN echo "no" | flutter emulators --create avdmanager create avd -n test -k "system-images;android-30;google_apis_playstore;x86"
# RUN flutter emulators --launch test -no-audio -no-snapshot -no-window -no-boot-anim -no-accel &
RUN /opt/android-sdk/emulator/emulator @flutter_emulator -no-audio -no-snapshot -no-window -no-boot-anim -no-accel
RUN flutter emulators
COPY tools /opt/tools
RUN /opt/tools/android-wait-for-emulator.sh built-in
RUN /opt/android-sdk/emulator/emulator -list-avds

RUN flutter doctor

# Clone test repo and run
RUN cd /home/developer && git clone https://github.com/jaffamonkey/flutter-gherkin-integration-test
RUN chmod -R 755 /home/developer/flutter-gherkin-integration-test
RUN cd /home/developer/flutter-gherkin-integration-test && flutter drive --driver=test_driver/integration_test_driver.dart --target=integration_test/gherkin_suite_test.dart
