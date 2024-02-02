// ignore_for_file: must_be_immutable
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/custome_page.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/guidelines/guidelines.dart';
import 'package:akdmvisitorsapp/model/guidelines/section.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';
import '../../common_widgets/custom_header.dart';
import '../../common_widgets/fancyShimmerCachedImage.dart';
import '../../utils/iconpath.dart';
import '../bloc/app_json/app_json_bloc.dart';
import '../bloc/app_json/app_json_events.dart';
import '../bloc/app_json/app_json_state.dart';
import '../bloc/guideline/guideline_bloc.dart';
import '../bloc/guideline/guideline_event.dart';
import '../bloc/guideline/guideline_state.dart';
import 'guideline_detail_page.dart';

@RoutePage()
class GuidLinesDetailScreen extends StatefulWidget {
  const GuidLinesDetailScreen({Key? key}) : super(key: key);

  @override
  State<GuidLinesDetailScreen> createState() => _GuidLinesDetailScreenState();
}

class _GuidLinesDetailScreenState extends State<GuidLinesDetailScreen> {
  Widget? guidLinesWidget;
  int _selectedChipIndex = -1;
  bool? isselected =false;
  Guidelines ? model;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        context.read<GuidelineBloc>().add(const GuidelineTapEvent(-1));
        return true;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: ColorPath.homeBgColor,
        appBar: CustomHeader(
          title: guidelines,
          redirectToHome: false,
        ),
        body:BlocBuilder<AppJsonBloc, AppJsonState>(
          bloc: GetIt.I<AppJsonBloc>()..add(const LoadAppJsonEvent()),
          builder: (context, state) {
            state.when(
              loading: () {
                guidLinesWidget = const Center(child: SizedBox());
              },
              loaded: (appJsonData) async {
                model = appJsonData.guidelines;
                guidLinesWidget= model != null ? buildGuideLineLayout():buildErrorLayout();
              },
              error: (error) {
                guidLinesWidget = CustomText(
                  text: error,
                  fontSize: 16,
                  underline: false,
                  fontWeight: FontWeight.w500,
                  color: ColorPath.primaryColor,
                );
              },
            );
           return guidLinesWidget!;
          },
        ),
      ),
    );
  }

  Widget buildGuideLineLayout() => SingleChildScrollView(
      child: BlocBuilder<GuidelineBloc,GuidelineState>(builder: (context, state) {
        _selectedChipIndex = state.currentIndex;
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpace(height: 14.h),
              Padding(
                padding: EdgeInsets.only(
                    top: 1.h, bottom: 1.h, left: 2.5.h),
                child: CustomText(
                  text: model!.description,
                  fontSize: 13.sp,
                  underline: false,
                  fontFamily: interFont,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w400,
                  color: ColorPath.liteGrayColor,
                  maxLine: 8,
                ),
              ),
              VerticalSpace(height: 2.h),
              model!.sections != null
                  ? _guideLinePage(model!.sections) : Container(),
            ]);
      })
  );

  Widget buildErrorLayout() =>Center(
    child: CustomPage(
      imageName: IconPaths.somethingWrongIcon,
      btnTitle: tryAgainMessage,
      description: somethingWrongMessage,
      onTap: () {},
    ),
  );

  Widget _guideLinePage(List<Section>? sections) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(2.h),
            child: Wrap(
              direction: Axis.horizontal,
              children: [
                for (int index = 0; index < sections!.length; index++)
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ChoiceChip(
                            selectedColor: _selectedChipIndex == index
                                ?  ColorPath.secondaryBrownColor :
                            ColorPath.secondaryBrownColor.withOpacity(0.10) ,
                            padding: EdgeInsets.all(1.h),
                            backgroundColor: _selectedChipIndex == index
                                ?  ColorPath.secondaryBrownColor :
                            ColorPath.secondaryBrownColor.withOpacity(0.10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                  color: ColorPath.secondaryBrownColor),
                            ),
                            label: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FancyShimmerCachedImage(
                                  imageUrl:sections[index].imageURL.toString(),
                                  boxFit: BoxFit.contain,
                                  errorWidget:Image.asset(IconPaths.placeholderImage),
                                  width:4.h,
                                  height:4.h,
                                ),
                                SizedBox(width: 1.h),
                                CustomText(
                                  text: sections[index].title!.toString(),
                                  fontSize: 16,
                                  underline: false,
                                  fontFamily: interFont,
                                  fontWeight: FontWeight.w600,
                                  color: _selectedChipIndex == index  ?  ColorPath.whiteColor.withOpacity(0.7) : ColorPath.blackprimary,
                                ),
                              ],
                            ),
                            selected: _selectedChipIndex == index ,
                            onSelected: (isSelected) {
                              if(isSelected == true ){
                                context.read<GuidelineBloc>().add(GuidelineTapEvent(index));
                              }else{
                                context.read<GuidelineBloc>().add(const GuidelineTapEvent(-1));
                                }
                            },
                          ),
                          if (_selectedChipIndex ==index)
                            Column(
                              children: [
                                SizedBox(height: 2.h),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: ColorPath.secondaryBrownColor,
                                    shape: BoxShape.rectangle,
                                    border: Border.all(color: ColorPath.secondaryBrownColor, width: 1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child:  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            FancyShimmerCachedImage(
                                              imageUrl:sections[index].imageURL.toString(),
                                              boxFit: BoxFit.contain,
                                              errorWidget:Image.asset(IconPaths.placeholderImage),
                                              width:4.h,
                                              height:4.h,
                                            ),
                                            const SizedBox(width: 8),
                                            CustomText(
                                              text: sections[index].title!.toString(),
                                              fontSize: 16,
                                              underline: false,
                                              fontFamily: interFont,
                                              fontWeight: FontWeight.w600,
                                              color:_selectedChipIndex == index   ?  ColorPath.whiteColor.withOpacity(0.7) : ColorPath.blackprimary,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        sections[index].content !=null ?  ListView.builder(
                                          shrinkWrap: true,
                                          padding: EdgeInsets.zero,
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount:
                                          sections[index].content!.length,
                                          itemBuilder: (context, selectedIndex) {
                                            return GuideLineDetailPage(content:sections[index].content![selectedIndex]);
                                          },
                                        ):Container()
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.h),
                              ],
                            )
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      );
  }
}
