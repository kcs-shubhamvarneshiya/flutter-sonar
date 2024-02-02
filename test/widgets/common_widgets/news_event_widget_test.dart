import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/news_event_widget.dart';
import 'package:akdmvisitorsapp/common_widgets/swiper_widget.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/utils/iconpath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget newsEventWidget(bool isEventContainer) {
    return MaterialApp(
      home: Sizer(
        builder: (context, orientation, deviceType) {
          return Material(
            child: NewsEventWidget(
              imageLength: IconPaths().sliderImages.length,
              imageUrl: IconPaths().sliderImages,
              title: '',
              publishedDate: '',
              description: '',
              eventStatus: '',
              eventDate: '',
              isEventContainer : isEventContainer,
              onNewsClick: () {},
            ),
          );
        },
      ),
    );
  }

   group('Test case for News Event Widget', () {


    testWidgets('News Event', (WidgetTester tester) async {
      await tester.pumpWidget(newsEventWidget(false));

      await tester.pump();

      expect(find.byType(NewsEventWidget), findsWidgets);

      expect(find.byType(Column), findsWidgets);

      expect(find.byType(SizedBox), findsWidgets);

      expect(find.byType(ClipRRect), findsWidgets);

      expect(find.byType(SwiperWidget), findsWidgets);

      expect(find.byType(Padding), findsWidgets);

      expect(find.byType(CustomText), findsWidgets);

      expect(find.byType(VerticalSpace), findsWidgets);

      expect(find.byType(Padding), findsWidgets);

      expect(find.byType(Row), findsWidgets);

      expect(find.byType(Container), findsWidgets);

      expect(find.byType(CustomText), findsWidgets);

      expect(find.byType(HorizontalSpace), findsWidgets);

      expect(find.byType(Container), findsWidgets);

      expect(find.byType(Row), findsWidgets);

      expect(find.byType(Padding), findsWidgets);

      expect(find.byType(ButtonIcon), findsWidgets);

      await tester.pump();

    });


    testWidgets('Click on button', (widgetTester) async{

      await widgetTester.pumpWidget(newsEventWidget(true));

      expect(find.byType(Expanded), findsWidgets);

      expect(find.byType(HorizontalSpace), findsWidgets);

      expect(find.byType(CustomText), findsWidgets);

      expect(find.byType(Container), findsWidgets);

      expect(find.byType(Padding), findsWidgets);

      expect(find.byType(Row), findsWidgets);

      expect(find.byType(SvgPicture), findsWidgets);

      expect(find.byType(SizedBox), findsWidgets);

    });
  });
}
