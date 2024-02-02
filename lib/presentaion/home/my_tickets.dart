import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';

import '../../utils/iconpath.dart';

//MyTickets
class MyTickets extends StatelessWidget {
  const MyTickets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:const [
                CustomText(
                text: myTickets,
                fontSize: 18,
                underline: false,
                fontWeight: FontWeight.w500,
                color: ColorPath.primaryColor,
              ),
                CustomText(
                text: viewMore,
                fontSize: 12,
                underline: false,
                fontWeight: FontWeight.normal,
                color: ColorPath.redColor,
              ),
            ],
          ),
          const VerticalSpace(height: 15),
          //MyTickets design
          ListView.separated(
            separatorBuilder: (context, index) => const VerticalSpace(
              height: 10,
            ),
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: ColorPath.redColor),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    color: ColorPath.redColor50,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.airplane_ticket,
                    color: ColorPath.redColor,
                    size: 30,
                  ),
                ),
                title: CustomText(
                  text: IconPaths().ticketsType[index],
                  fontSize: 15,
                  underline: false,
                  fontWeight: FontWeight.w500,
                  color: ColorPath.primaryColor,
                ),
                subtitle: const CustomText(
                  text: bookTickets,
                  fontSize: 12,
                  underline: false,
                  fontWeight: FontWeight.normal,
                  color: ColorPath.primaryColor,
                ),
                trailing: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorPath.primaryColor,
                  ),
                  child: const Icon(
                    Icons.double_arrow,
                    color: ColorPath.unSelContainer,
                  ),
                ),
              );
            },
          ),
          const VerticalSpace(height: 15),
        ],
      ),
    );
  }
}
