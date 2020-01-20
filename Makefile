.PHONY: config build-android debug-android

all:


config: cargo-config.toml
	cp cargo-config.toml ./platform/android/.cargo/config

build-android: ./platform/android/src/*
	cd ./platform/android && \
		cargo build --target aarch64-linux-android --release && \
		cargo build --target armv7-linux-androideabi --release && \
		cargo build --target i686-linux-android --release
	cd ./build-templates/android/app/src/main && \
		mkdir -p jniLibs && \
		mkdir -p jniLibs/arm64-v8a && \
		mkdir -p jniLibs/armeabi-v7a && \
		mkdir -p jniLibs/x86 && \
	ln -fs ../../../../../../../platform/android/target/aarch64-linux-android/release/libspinelandroid.so jniLibs/arm64-v8a/libspinelandroid.so && \
	ln -fs ../../../../../../../platform/android/target/armv7-linux-androideabi/release/libspinelandroid.so jniLibs/armeabi-v7a/libspinelandroid.so && \
	ln -fs ../../../../../../../platform/android/target/i686-linux-android/release/libspinelandroid.so jniLibs/x86/libspinelandroid.so
	cd ./build-templates/android && \
		./gradlew assembleDebug

debug-android:
	cd ./build-templates/android && \
		adb shell am start -n "org.spinel.android/org.spinel.android.MainActivity" -a android.intent.action.MAIN -c android.intent.category.LAUNCHER
