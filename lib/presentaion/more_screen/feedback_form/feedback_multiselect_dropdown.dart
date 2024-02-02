// ignore_for_file: must_be_immutable
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/model/feedback/feedback_form.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:sizer/sizer.dart';

import '../../../common_widgets/widgets.dart';
import '../../bloc/feedback_component/feedback_component_bloc.dart';
import '../../bloc/feedback_component/feedback_component_event.dart';
import '../../bloc/feedback_component/feedback_component_state.dart';

class FeedbackMultiselectDropdown extends StatelessWidget {
  FeedbackMultiselectDropdown({
    Key? key,
    required this.getCheckedValue,
    required this.fields,
  }) : super(key: key);
  final Function getCheckedValue;
  final Fields fields;

  List<String> optionList = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FeedbackComponentBloc>(
        create: (context) => GetIt.I<FeedbackComponentBloc>()..add(FeedbackOptionItemEvent(fields.options!)),
      child:Column(
          key: const Key('originColumn'),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              key: const Key('originRow'),
              children: [
                CustomText(
                  key: const Key('fieldName'),
                  text: fields.fieldName.toString(),
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
                  text: fields.required! ? requiredText : optionalText,
                  color: fields.required! ? ColorPath.notificationBadge : ColorPath.primaryColor,
                  fontFamily: interFont,
                  fontSize: 10.sp,
                  maxLine: 2,
                  fontWeight: FontWeight.w400,
                  underline: false,
                ),
              ],
            ),
            VerticalSpace(height: 1.5.h),
            BlocBuilder<FeedbackComponentBloc, FeedbackComponentState>(
                builder: (context, state){
                setOptionList(state.optionList,context);
                return MultiSelectDialogField(
                  dialogHeight: 40.h,
                  //backgroundColor: ColorPath.redColor50,
                  backgroundColor: ColorPath.containerBorderColor,
                  searchable: false,
                  items:state.optionItemList,
                  selectedColor: ColorPath.primaryButtonColor,
                  decoration: BoxDecoration(
                    color: ColorPath.primaryButtonColor.withOpacity(.05),
                    borderRadius: BorderRadius.circular(1.h),
                    border: Border.all(
                      color: ColorPath.primaryButtonColor.withOpacity(.5),
                    ),
                  ),
                  buttonIcon: const Icon(Icons.arrow_drop_down_circle_outlined,
                      color: ColorPath.primaryButtonColor),
                  onConfirm: (results) {
                    context.read<FeedbackComponentBloc>().add(FeedbackOptionListEvent(results));
                  },
                  validator: (value) {
                    if (fields.required!) {
                      if (optionList.isEmpty) {
                        return requiredField;
                      }
                      return null;
                    } else {
                      return null;
                    }
                  },
                );
              }
            ),
            VerticalSpace(height: 1.5.h),
          ],
        ),
    );
  }

  void setOptionList(List<Option> resultList, BuildContext context) {
    optionList.clear();
    for(var option in resultList){
      optionList.add(option.value.toString());
    }
    getCheckedValue(optionList);
    FocusScope.of(context).requestFocus(FocusNode());
  }
}

class Option {
  final String key;
  final String value;

  Option({
    required this.key,
    required this.value,
  });
}
