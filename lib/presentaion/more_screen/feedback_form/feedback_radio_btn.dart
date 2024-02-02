import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';

import '../../../model/feedback/feedback_form.dart';
import '../../bloc/feedback_component/feedback_component_bloc.dart';
import '../../bloc/feedback_component/feedback_component_event.dart';
import '../../bloc/feedback_component/feedback_component_state.dart';

class FeedbackRadio extends StatelessWidget {
  FeedbackRadio({
    Key? key,
    this.press,
    this.fields,
  }) : super(key: key);
  String? radioBtnValue = "";
  final Function? press;
  final Fields? fields;

  String? selectedRadioButton;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FeedbackComponentBloc>(
        create: (context) => GetIt.I<FeedbackComponentBloc>(),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomText(
                  text: fields!.fieldName!.toString(),
                  color: ColorPath.primaryColor,
                  fontFamily: interFont,
                  fontSize: 11.sp,
                  maxLine: 2,
                  fontWeight: FontWeight.w400,
                  underline: false,
                ),
                HorizontalSpace(width: .5.h),
                CustomText(
                  text: fields!.required! ? requiredText : optionalText,
                  color: fields!.required! ? ColorPath.notificationBadge : ColorPath.primaryColor,
                  fontFamily: interFont,
                  fontSize: 10.sp,
                  maxLine: 2,
                  fontWeight: FontWeight.w400,
                  underline: false,
                ),
              ],
            ),
            VerticalSpace(key:const Key('originVerticalSpace'),height: 1.5.h),
            SizedBox(
                height: 6.h,
                child: FormField(
                  builder: (FormFieldState<bool> state) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: BlocBuilder<FeedbackComponentBloc, FeedbackComponentState>(
                          builder: (context, feedbackState){
                            selectedRadioButton=feedbackState.selectedValue.toString();
                            press!(selectedRadioButton);
                            if (selectedRadioButton!.isEmpty) {
                              selectedRadioButton = fields!.options![0].value;
                            }
                              return ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: fields!.options!.length,
                                itemBuilder: (context, index1) {
                                  return SizedBox(
                                    width: 15.h,
                                    child: RadioListTile(
                                      activeColor: ColorPath.primaryButtonColor,
                                      visualDensity: const VisualDensity(
                                          horizontal: -4, vertical: -4),
                                      contentPadding: EdgeInsets.zero,
                                      title: CustomText(
                                        text: fields!.options![index1].value!,
                                        color: ColorPath.primaryColor,
                                        fontFamily: interFont,
                                        fontSize: 11.sp,
                                        maxLine: 2,
                                        fontWeight: FontWeight.w400,
                                        underline: false,
                                      ),
                                      value: fields!.options![index1].value,
                                      //groupValue: widget.radioBtnValue.toString(),
                                      groupValue: selectedRadioButton,
                                      selected: true,
                                      toggleable: true,
                                      onChanged: (value) {
                                        context.read<FeedbackComponentBloc>().add(FeedbackOnChangeRadioEvent(value.toString()));
                                        //state.setValue(true);
                                      },
                                    ),
                                  );
                                },
                              );
                            }
                          ),
                        ),
                        state.hasError
                            ? Padding(
                                padding: EdgeInsets.only(left: 1.5.h),
                                child: CustomText(
                                  text: state.errorText,
                                  color: ColorPath.notificationBadge,
                                  fontFamily: interFont,
                                  fontSize: 9.sp,
                                  maxLine: 2,
                                  fontWeight: FontWeight.w400,
                                  underline: false,
                                ),
                              )
                            : Container(),
                      ],
                    );
                  },
                   validator: (value) {
                  if (fields!.required!) {
                    if (selectedRadioButton == "" || selectedRadioButton=="null") {
                      return requiredField;
                    }
                    return null;
                  } else {
                    return null;
                  }
                },
                )),
            VerticalSpace(height: 1.5.h),
          ],
        ),
    );
  }
}
