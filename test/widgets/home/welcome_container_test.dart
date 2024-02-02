import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/campus/campus.dart';
import 'package:akdmvisitorsapp/presentaion/home/welcome_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  //address model
  final address = Address(street: "112 N Main St", city: "Windsor", state: "NJ", postal: "08561");

  //contact info list
  final List<ContactInfo> contactInfo = [];
  contactInfo.add(ContactInfo(type: "tel", title: "Reception", value: "+1-609-918-1212"));
  contactInfo.add(ContactInfo(type: "email", title: "Media Inquiries", value: "mediarelations@na.baps.org"));

  final campusObject = Campus(
    name:"Welcome Akshardham",
    description: "This data is coming from the file stored in asset folder in the project.",
    latitude: "40.2537234",
    longitude: "-74.5797675",
    address: address,
    contactInfo: contactInfo,
  );

  testWidgets('WelcomeContainer displays text and description', (WidgetTester tester) async {
    // Create a Campus object to pass to the WelcomeContainer
    final campus = campusObject;

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home:Sizer(
        builder: (context, orientation, deviceType) {
          return WelcomeContainer(campus: campus);
        }
      ),
    ));

    // Verify that the welcome text is displayed
    expect(find.text('Welcome'), findsOneWidget);

    expect(find.text('This data is coming from the file stored in asset folder in the project.'), findsOneWidget);

    final customText = find.byType(CustomText);
    expect(customText, findsNWidgets(2));

    final verticalSpace = find.byType(VerticalSpace);
    expect(verticalSpace, findsNWidgets(2));

  });
}


