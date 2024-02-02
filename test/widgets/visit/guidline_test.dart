import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/fancyShimmerCachedImage.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/guidelines/content.dart';
import 'package:akdmvisitorsapp/model/guidelines/guidelines.dart';
import 'package:akdmvisitorsapp/model/guidelines/section.dart';
import 'package:akdmvisitorsapp/presentaion/visit/guidlines.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp((){});

  List<String> imageList = [];
  imageList.add("https://www.baps.org/Data/Sites/1/Media/ModuleRotatorImages/image_6483441.JPG");
  imageList.add("https://www.baps.org/Data/Sites/1/Media/ModuleRotatorImages/SAV%20Mandir_002.jpg");

  //contentList
  final List<Content> contentList=[];
  contentList.add(Content(order: 1,imageURL:imageList,text:"Please note that a strict dress code operates within the complex.",videoUrl: "http://abc.com"));

  final List<Section> sectionList=[];
  sectionList.add(Section(title: "Dress Code",imageURL: "https://akdmves.baps-apps.org/GuidelineIcons/1697104632851_clothes-hoodie.png",content:contentList));

  final guidLineData = Guidelines(
      image: "https://upload.wikimedia.org/wikipedia/commons/7/77/Akshardham_Gandhinagar_Gujarat.jpg",
      description:"During your visit, we kindly ask you be respectful of fellow visitors and the campus. See our full list of visitor guidelines to learn more.",
      link: "https://www.baps.org/Terms-and-Conditions.aspx",
      sections:sectionList
  );

  // Guidelines widget
  Widget guidelineWidget(Guidelines guidLineData) {
    return MaterialApp(
      home: Scaffold(
        body: Sizer(
          builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {
            return GuidLinesScreen(guideline: guidLineData,);
          },
        ),
      ),
    );
  }

  group('Guidelines widget', () {

    // guideline widget test case
    testWidgets('Guideline Section ', (WidgetTester tester) async {

      await tester.pumpWidget(guidelineWidget(guidLineData));

      await tester.pump();

      expect(find.byType(GuidLinesScreen), findsWidgets);

      expect(find.byType(DecoratedBox), findsNWidgets(2));

      expect(find.byType(Column), findsWidgets);

      expect(find.byType(CustomText), findsWidgets);

      expect(find.byType(Container), findsWidgets);

      expect(find.byType(ButtonIcon), findsOneWidget);

      expect(find.byType(SizedBox), findsOneWidget);

      expect(find.byType(FancyShimmerCachedImage), findsOneWidget);

    });


  });

}
