// ignore_for_file: must_be_immutable
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/feedback_component/feedback_component_event.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';

import '../../../model/feedback/feedback_form.dart';
import '../../bloc/feedback_component/feedback_component_bloc.dart';
import '../../bloc/feedback_component/feedback_component_state.dart';

class FeedbackCheckbox extends StatelessWidget {
  FeedbackCheckbox({
    Key? key,
    this.press,
    this.fields,
    this.isRequired,
  }) : super(key: key);
  final Fields? fields;
  final Function? press;
  bool? isRequired = false;

  List<String> userCheck = [];
  List<String> selectedValue = [];
  List<int> isChecked = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FeedbackComponentBloc>(
      create: (context) => GetIt.I<FeedbackComponentBloc>(),
      child: Column(
        key: const Key('originColumn'),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            key: const Key('originRow'),
            children: [
              CustomText(
                key: const Key('fieldName'),
                text: fields!.fieldName.toString(),
                color: ColorPath.primaryColor,
                fontFamily: interFont,
                fontSize: 11.sp,
                maxLine: 2,
                fontWeight: FontWeight.w400,
                underline: false,
              ),
              HorizontalSpace(width: .5.h),
              CustomText(
                key: const Key('isRequired'),
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
          VerticalSpace(height: 1.5.h),
          FormField(
            validator: (value) {
              if (fields!.required!) {
                if (userCheck.length == 0) {
                  return requiredField;
                }
                return null;
              } else {
                return null;
              }
            },
            builder: (FormFieldState<bool> state) {
              return Column(
                key: const Key('formFieldColumn'),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<FeedbackComponentBloc, FeedbackComponentState>(
                      builder: (context, state){
                        state.checkState == true
                            ? isSelectedValueFromList(state.checkedIndex,fields!.options)//userCheck.add(fields!.options![state.checkedIndex].value.toString())
                            : isRemovedValueFromList(state.checkedIndex,fields!.options);//userCheck.remove(fields!.options![state.checkedIndex].value.toString());
                        if(fields!.options![state.checkedIndex].isChecked == true) {
                          selectedValue.add(fields!.options![state.checkedIndex].value.toString());
                        }else{
                          selectedValue.remove(fields!.options![state.checkedIndex].value.toString());
                        }
                        press!(selectedValue.toList());
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        fields!.options!.length,
                        (index){
                          return CheckboxListTile(
                            key: ValueKey(UniqueKey()),
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: EdgeInsets.zero,
                            activeColor: ColorPath.primaryButtonColor,
                            dense: true,
                            selected: userCheck.contains(fields!.options![index].key.toString()),
                            title: CustomText(
                              text: fields!.options![index].value.toString(),
                              fontSize: 11.sp,
                              underline: false,
                              fontFamily: interFont,
                              fontWeight: FontWeight.w300,
                              color: ColorPath.primaryColor,
                            ),
                            value:userCheck.contains(fields!.options![index].key.toString()),
                            onChanged: (value) {
                              context.read<FeedbackComponentBloc>().add(FeedbackOnChangeCheckBoxEvent(value!,index));
                            },
                          );
                        },
                      ),
                    );
                  }),
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
          ),
          VerticalSpace(height: 1.5.h),
        ],
      ),
    );
  }

  void isSelectedValueFromList(index, List<FeedbackOptions>? options){
    options![index].isChecked = true;
    userCheck.add(options[index].key.toString());
  }

  void isRemovedValueFromList(index, List<FeedbackOptions>? options){
    options![index].isChecked = false;
    userCheck.remove(options[index].key.toString());

  }
}
