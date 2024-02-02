import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/announcements/announcements.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/announcement/announcement_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/home/announcement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';

final getIt = GetIt.instance;
// Register the AnnouncementsBloc as a singleton
void setupLocator() {
  getIt.registerLazySingleton(() => AnnouncementsBloc());
}

void main() {
  setupLocator();
  TestWidgetsFlutterBinding.ensureInitialized();
  late AnnouncementsBloc announcementsBloc;


  setUp(() {
    announcementsBloc = AnnouncementsBloc();
    announcementsBloc.startDisplayingData();
  });

  group('Announcement section test', () {

    List<Announcements> announcements = [
      Announcements(
          id: 1,
          priority: "INFO",
          title: "Update to Mandir Timings",
          message: "Mandir timings have been updated to reflect the summer visiting hours",
          details: "",
          thumbnail: "https://upload.wikimedia.org/wikipedia/commons/7/77/Akshardham_Gandhinagar_Gujarat.jpg",
          startTime: "2023-12-30T01:13:03.074Z",
          endTime: "2023-12-30T02:13:03.074Z"),
    ];

    var filteredAnnouncementList = announcements.where((element) {
      var endTime = DateTime.parse(element.endTime.toString());
      return endTime.isAfter(DateTime.now());
    }).toList();

    Widget announcementWidget() {
      return MaterialApp(
        home: Scaffold(
          body: Sizer(
            builder: (context, orientation, deviceType) {
              return  BlocProvider(
                  create: (context) => announcementsBloc,
                  child: AnnouncementsWidget(announcements: filteredAnnouncementList));

            },
          ),
        ),
      );
    }

    testWidgets('Announcement Container ', (WidgetTester tester) async {
      final announcementsBloc = AnnouncementsBloc();

      await tester.pump();

      await tester.pumpWidget(announcementWidget());

      await tester.pump(const Duration(seconds: 5));

      expect(find.text('Mandir timings have been updated to reflect the summer visiting hours'), findsWidgets);

      expect(find.byType(AnimatedOpacity), findsWidgets);

      expect(find.byType(Container), findsNWidgets(3));

      expect(find.byType(Column), findsNWidgets(4));

      expect(find.byType(VerticalSpace), findsWidgets);

      expect(find.byType(ListTile), findsWidgets);

      expect(find.byType(CustomText), findsWidgets);

      announcementsBloc.close();

    });

  });

}

