// ignore_for_file: must_be_immutable
import 'dart:convert';

import 'package:akdmvisitorsapp/common_widgets/custome_page.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/submit_feedback/submit_feedback_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/submit_feedback/submit_feedback_events.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/submit_feedback/submit_feedback_state.dart';
import 'package:akdmvisitorsapp/presentaion/more_screen/feedback_form/feedback_text_field.dart';
import 'package:akdmvisitorsapp/service/connection_service.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';

import '../../../common_widgets/custom_header.dart';
import '../../../common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/dependencies.dart';
import '../../../model/feedback/submit_feedback.dart';
import '../../../router_page/app_router.dart';
import '../../../utils/enums.dart';
import '../../../utils/iconpath.dart';
import '../../bloc/app_json/app_json_bloc.dart';
import '../../bloc/app_json/app_json_events.dart';
import '../../bloc/app_json/app_json_state.dart';
import 'feedback_checkbox.dart';
import 'feedback_dropdown.dart';
import 'feedback_multiselect_dropdown.dart';
import 'feedback_radio_btn.dart';
import 'feedback_textarea.dart';

@RoutePage()
class FeedbackFromHome extends StatelessWidget {
  FeedbackFromHome({Key? key}) : super(key: key);

  Widget? feedbackScreenWidget;
  List<TextEditingController> textFieldController = [];
  List<TextEditingController> textAreaController = [];
  String radio = '';
  bool? isSubmited = false;
  List<String> textFieldData = [];
  List<String> textAreaData = [];
  String fields = '';
  List<Record> recordList = [];
  List<String> checkBox = [];
  String selectedItems = '';
  List multiSelectedItems = [];
  var finalData;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPath.bottomNavBgColor,
      appBar:CustomHeader(title: submitFeedback,
          redirectToHome: false),
      body: MultiBlocProvider(
        providers: [
         BlocProvider(
            create: (context) => GetIt.I<SubmitFeedbackBloc>(),
          ),
          BlocProvider(
            create: (context) =>
                GetIt.I<AppJsonBloc>()..add(const LoadAppJsonEvent()),
            lazy: false,
          )
        ],
        child: BlocBuilder<SubmitFeedbackBloc, SubmitFeedbackState>(
          builder: (context, submitFeedbackState) {
            submitFeedbackState.when(
              feedbackLoading: (value) {
                if (value == true) {
                   isSubmited = true;
                }
              },
              feedbackLoaded: (appJsonData) {
                getIt<AppRouter>().replace(ThankYouScreenRoute());
              },
              feedbackError: (error) {
                isSubmited = false;
                feedbackScreenWidget = CustomText(
                  text: error,
                  fontSize: 13.sp,
                  underline: false,
                  fontWeight: FontWeight.w500,
                  color: ColorPath.primaryColor,
                );
              },
              feedbackInternetAvailable: (value) {
              },
            );
            return  BlocProvider(
              create: (context) =>
              GetIt.I<AppJsonBloc>()..add(const LoadAppJsonEvent()),
               child : BlocBuilder<AppJsonBloc, AppJsonState>(
                builder: (context, state) {
               state.when(
                loading: () {
                  feedbackScreenWidget = const Center(child: CircularProgressIndicator(color: ColorPath.primaryButtonColor,));
                },
                loaded: (appJsonData) {
                  feedbackScreenWidget = appJsonData
                              .feedbackForm!.fields?[0].fieldName ==
                          null
                      ? Center(
                          child: CustomPage(
                            imageName: IconPaths.somethingWrongIcon,
                            description: somethingWrong,
                            onTap: () {},
                            btnTitle: tryAgainMessage,
                          ),
                        )
                      : isSubmited == true
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Center(
                                    child: SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: CircularProgressIndicator(color: ColorPath.primaryButtonColor,))),
                                VerticalSpace(height: 1.5.h),
                                CustomText(
                                  text: submitingFeedback,
                                  fontSize: 13.sp,
                                  underline: false,
                                  fontWeight: FontWeight.w500,
                                  color: ColorPath.primaryColor,
                                )
                              ],
                            ):
                            SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.only(top: 1.5.h),
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ListView.builder(
                                        padding: EdgeInsets.zero,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: appJsonData
                                            .feedbackForm!.fields!.length,
                                        itemBuilder: (context, index) {
                                          textFieldController
                                              .add(TextEditingController());
                                          textAreaController
                                              .add(TextEditingController());
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2.h),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                //textfield/textbox
                                                appJsonData
                                                            .feedbackForm!
                                                            .fields![index]
                                                            .fieldType ==
                                                        FieldType.textBox.name
                                                    ? FeedbackTextField(
                                                        fieldName: appJsonData
                                                            .feedbackForm!
                                                            .fields![index]
                                                            .fieldName,
                                                        isRequired: appJsonData
                                                            .feedbackForm!
                                                            .fields![index]
                                                            .required!,
                                                        controller:
                                                            textFieldController[
                                                                index],
                                                      )
                                                    : const SizedBox(),
                                                //dropdown
                                                appJsonData
                                                            .feedbackForm!
                                                            .fields![index]
                                                            .fieldType ==
                                                        FieldType.dropdown.name
                                                    ? FeedbackDropdown(
                                                        press: (value) {
                                                          selectedItems = value;
                                                          appJsonData
                                                              .feedbackForm!
                                                              .fields![index]
                                                              .answer = value;
                                                        },
                                                        fields: appJsonData
                                                            .feedbackForm!
                                                            .fields![index],
                                                      )
                                                    : const SizedBox(),
                                                //multiselect
                                                appJsonData
                                                            .feedbackForm!
                                                            .fields![index]
                                                            .fieldType ==
                                                        FieldType
                                                            .multiSelectDropdown
                                                            .name
                                                    ? FeedbackMultiselectDropdown(
                                                        getCheckedValue:
                                                            (selectCheck) {
                                                          multiSelectedItems =
                                                              selectCheck;
                                                          appJsonData
                                                                  .feedbackForm!
                                                                  .fields![index]
                                                                  .answer =
                                                              selectCheck
                                                                  .toString();
                                                        },
                                                        fields: appJsonData
                                                            .feedbackForm!
                                                            .fields![index],
                                                      )
                                                    : const SizedBox(),
                                                //radio
                                                // ignore: unrelated_type_equality_checks
                                                appJsonData
                                                            .feedbackForm!
                                                            .fields![index]
                                                            .fieldType ==
                                                        FieldType.radio.name
                                                    ? FeedbackRadio(
                                                        press: (selectedRadio) {
                                                          appJsonData
                                                                  .feedbackForm!
                                                                  .fields![index]
                                                                  .answer =
                                                              selectedRadio;
                                                        },
                                                        fields: appJsonData
                                                            .feedbackForm!
                                                            .fields![index])
                                                    : const SizedBox(),
                                                appJsonData
                                                            .feedbackForm!
                                                            .fields![index]
                                                            .fieldType ==
                                                        FieldType.checkBox.name
                                                    ? FeedbackCheckbox(
                                                        press: (selectedCheck) {
                                                          checkBox =
                                                              selectedCheck;
                                                          appJsonData
                                                                  .feedbackForm!
                                                                  .fields![index]
                                                                  .answer =
                                                              selectedCheck
                                                                  .toString();
                                                        },
                                                        isRequired: appJsonData
                                                            .feedbackForm!
                                                            .fields![index]
                                                            .required,
                                                        fields: appJsonData
                                                            .feedbackForm!
                                                            .fields![index],
                                                      )
                                                    : const SizedBox(),
                                                //textArea
                                                appJsonData
                                                            .feedbackForm!
                                                            .fields![index]
                                                            .fieldType ==
                                                        FieldType.textArea.name
                                                    ? FeedbackTextArea(
                                                        controller:
                                                            textAreaController[
                                                                index],
                                                        fieldName: appJsonData
                                                            .feedbackForm!
                                                            .fields![index]
                                                            .fieldName,
                                                        isRequired: appJsonData
                                                            .feedbackForm!
                                                            .fields![index]
                                                            .required!,
                                                        hintText: enterFeedback,
                                                      )
                                                    : const SizedBox(),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      VerticalSpace(height: 1.5.h),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 2.h),
                                        height: 6.5.h,
                                        width: double.infinity,
                                        child: ButtonIcon(
                                          onTap: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              /// getting the data from Jason
                                              recordList.clear();
                                              var submitFeedbackModel =
                                                  appJsonData
                                                      .feedbackForm!.fields;
                                              for (int i = 0;
                                                  i < textFieldController.length;
                                                  i++) {
                                                if (textFieldController[i]
                                                    .text
                                                    .toString()
                                                    .isNotEmpty) {
                                                  textFieldData.add(
                                                      textFieldController[i]
                                                          .text
                                                          .toString());
                                                  submitFeedbackModel![i].answer =
                                                      textFieldController[i]
                                                          .text
                                                          .toString();
                                                }
                                              }
                                              for (int j = 0;
                                                  j < textAreaController.length;
                                                  j++) {
                                                if (textAreaController[j]
                                                    .text
                                                    .toString()
                                                    .isNotEmpty) {
                                                  textAreaData.add(
                                                      textAreaController[j]
                                                          .text
                                                          .toString());
                                                  submitFeedbackModel![j].answer =
                                                      textAreaController[j]
                                                          .text
                                                          .toString();
                                                }
                                              }

                                              ///preapare the model for submit api
                                              for (var v in submitFeedbackModel!) {
                                                var record = Record();
                                                record.fieldValue = "";
                                                if (v.fieldType == FieldType.radio.name) {
                                                  record.fieldName = v.fieldName;
                                                  record.fieldValue = v.answer;
                                                } else if (v.fieldType ==
                                                    FieldType.textBox.name) {
                                                  record.fieldName = v.fieldName;
                                                  record.fieldValue = v.answer;
                                                } else if (v.fieldType ==
                                                    FieldType.textArea.name) {
                                                  record.fieldName = v.fieldName;
                                                  record.fieldValue = v.answer;
                                                } else if (v.fieldType ==
                                                    FieldType.dropdown.name) {
                                                  if (selectedItems.isNotEmpty) {
                                                    record.fieldName =
                                                        v.fieldName;
                                                    record.fieldValue = v.answer;
                                                  }
                                                } else if (v.fieldType ==
                                                    FieldType.checkBox.name) {
                                                  if (checkBox.isNotEmpty) {
                                                    record.fieldName = v.fieldName;
                                                    record.fieldValue = v.answer!.replaceAll('[', '').replaceAll(']', '');
                                                  }
                                                } else if (v.fieldType ==
                                                    FieldType.multiSelectDropdown
                                                        .name) {
                                                  if (multiSelectedItems.isNotEmpty){
                                                    record.fieldName = v.fieldName;
                                                    record.fieldValue = v.answer!.replaceAll('[', '').replaceAll(']', '');
                                                  }
                                                }
                                                recordList.add(record);
                                              }
                                              print("jsonnn ${jsonEncode(recordList)}");
                                              ///initalize the block for api call
                                              context.read<SubmitFeedbackBloc>()
                                                  .add(SubmitFeedbackEvent
                                                  .loadUserEvent(recordList));
                                            } else {
                                              context.customSnackBar(context,
                                                  requiredFieldMessage, okText);
                                            }
                                          },
                                          buttonName: submitText,
                                          buttonIcon: IconPaths.rightWhiteIcon,
                                          color: ColorPath.primaryButtonColor,
                                          borderColor: ColorPath.primaryButtonColor,
                                          textColor: ColorPath.whiteColor,
                                        ),
                                      ),
                                      VerticalSpace(height: 3.h),
                                    ],
                                  ),
                                ),
                              ));
                },
                error: (error) {
                  CustomText(
                    text: error,
                    fontSize: 13.sp,
                    underline: false,
                    fontWeight: FontWeight.w500,
                    color: ColorPath.primaryColor,
                  );
                },
              );
              return feedbackScreenWidget!;
            }));
          },
        ),
      ),
    );
  }
}
