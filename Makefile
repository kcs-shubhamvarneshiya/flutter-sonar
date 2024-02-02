configure:
	flutterfire configure -p akdm-ve -a "org.baps.na.akdmve" -i "org.baps.na.akdmve" -y

generate:
	dart run build_runner build --delete-conflicting-outputs

generate-watch:
	dart run build_runner watch --delete-conflicting-outputs

build-ios:
	flutter build ios --release

ios: generate configure build-ios

build-android:
	flutter build appbundle --release

android: generate configure build-android
