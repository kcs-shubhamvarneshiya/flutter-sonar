import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/sign_out_alert.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/user_model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Sign out alert test case', () {

    final userModel = UserModel(
        id:"1234567890",
        requestorid:"9876543210",
        resourceuri:"/api/v1/users",
        additionalinfo:"This is additional information.",
        nonce:"abcdef0123456789",
        uid:"1234567890",
        sid:"9876543210",
        aid:"1234567890",
        cid:"9876543210",
        auth:"bearer",
        fn:"John",
        ln:"Doe",
        pid:"1234567890",
        ct:"1234567890",
        role:"admin",
        nbf:1597470000,
        exp:1628934000,
        iat:1597469400,
        iss:"https://example.com",
        aud:"https://api.example.com"
    );

    Widget signOutAlertDialogWidget() {
      return MaterialApp(
        home: Sizer(
          builder: (context, orientation, deviceType) {
            return Scaffold(
              body: SignOutAlert(model: userModel),
            );
          },
        ),
      );
    }

    testWidgets('Sign out Alert', (WidgetTester tester) async {

      await tester.pumpWidget(signOutAlertDialogWidget());

      await tester.pump();

      expect(find.byType(SignOutAlert), findsWidgets);

      expect(find.byType(SizedBox), findsWidgets);

      expect(find.byType(Column), findsWidgets);

      expect(find.byType(Align), findsWidgets);

      expect(find.byType(Container), findsWidgets);

      expect(find.byType(CustomText), findsWidgets);

      expect(find.text("John Doe"), findsOneWidget);

      expect(find.byType(VerticalSpace), findsNWidgets(2));

      expect(find.byType(SvgPicture), findsNWidgets(2));

      expect(find.byType(Padding), findsNWidgets(4));

      expect(find.byType(SvgPicture), findsNWidgets(2));

      expect(find.byType(ButtonIconDialog), findsWidgets);


    });

    testWidgets('Click on cross icon button to close the alert',
        (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(signOutAlertDialogWidget());
      final Finder buttonToTap = find.byKey(const Key('close_alert'));
      await widgetTester.dragUntilVisible(
        buttonToTap,
        find.byType(Row),
        const Offset(0, 50),
      );
      await widgetTester.tap(buttonToTap);
      await widgetTester.pump();
    });

    testWidgets('Click on sign out button', (WidgetTester tester) async {
      await tester.pumpWidget(signOutAlertDialogWidget());

      await tester.tap(find.byType(ButtonIconDialog));

      await tester.pump();
    });
  });
}
