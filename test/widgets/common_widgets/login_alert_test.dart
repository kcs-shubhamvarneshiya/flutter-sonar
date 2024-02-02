import 'dart:io';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/login_alert.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/utils/iconpath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  File getProjectFile(String path) {
    final String assetFolderPath = Platform.environment['UNIT_TEST_ASSETS']!;
    return File('$assetFolderPath/$path');
  }

  Widget loginAlertDialogWidget() {
    return MaterialApp(
      home: Scaffold(
        body: Sizer(
          builder: (context, orientation, deviceType) {
            return const LoginAlert();
          },
        ),
      ),
    );
  }

  testWidgets('LoginAlert widget test', (WidgetTester tester) async {
    // Build our widget and trigger a frame.

    await tester.pumpWidget(loginAlertDialogWidget());

    // Test if the texts are present.
    expect(find.text('Enter your email address or phone number'), findsOneWidget);

    expect(find.text('Sign in via BAPS SSO'), findsOneWidget);

    expect(find.text('OR'), findsOneWidget);

    expect(find.text('BAPS Member'), findsOneWidget);


    // Test if the phone sign-in button is present
    await tester.tap(find.text('Sign in with phone number'));
    await tester.pump();

    // Test if the email sign-in button is present
    await tester.tap(find.text('Sign in with email'));
    await tester.pump();

    // Test if the sign-in SSO button is present
    /*await tester.tap(find.text('Sign in via BAPS SSO'));
    await tester.pump();*/

    // Test if the "or" container is present
    expect(find.byType(Container), findsWidgets);

    expect(find.byType(CustomText), findsNWidgets(5));

    expect(find.byType(ButtonIcon), findsWidgets);

    expect(find.byType(SvgPicture), findsNWidgets(5));


    var pathForwardIcon  = IconPaths.rightBrownIcon;
    final exists = getProjectFile(pathForwardIcon).existsSync();
    expect(exists, isTrue, reason: '$pathForwardIcon does not exist');

    var pathCancelIcon  = IconPaths.shareIconButton;
    final cancelIcon = getProjectFile(pathCancelIcon).existsSync();
    expect(cancelIcon, isTrue, reason: '$pathCancelIcon does not exist');

    var pathPhoneIcon  = IconPaths.phoneRoundedIcon;
    final phoneIcon = getProjectFile(pathPhoneIcon).existsSync();
    expect(phoneIcon, isTrue, reason: '$pathPhoneIcon does not exist');

    var pathEmailIcon  = IconPaths.emailRoundedIcon;
    final emailIcon = getProjectFile(pathEmailIcon).existsSync();
    expect(emailIcon, isTrue, reason: '$pathEmailIcon does not exist');

  });
}
