import 'package:codealpha_flashcard_quiz_app/controller/addflashcard_controller.dart';
import 'package:codealpha_flashcard_quiz_app/core/components/customtextformfield.dart';
import 'package:codealpha_flashcard_quiz_app/core/constants/colors.dart';
import 'package:codealpha_flashcard_quiz_app/view/widgets/addquiz/optionsgesture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddFlashCard extends StatelessWidget {
  const AddFlashCard({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddFlashcardController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.h,
        foregroundColor: Colors.white,
        backgroundColor: AppColors.third,
        title: Text(
          'Add FlashCard',
          style: TextStyle(
              fontWeight: FontWeight.w700, letterSpacing: 2, fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            child: GetBuilder<AddFlashcardController>(builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50.h,
                    margin: EdgeInsets.only(top: 50.h, bottom: 30.h),
                    child: CustomTextFormField(
                      mycontroller: controller.question,
                      enabled: true,
                      labeltext: 'Question',
                    ),
                  ),
                  AnswerField(
                    hinttext: 'Answer A',
                    mycontroller: controller.answerone,
                  ),
                  AnswerField(
                    hinttext: 'Answer B',
                    mycontroller: controller.answertwo,
                  ),
                  AnswerField(
                    hinttext: 'Answer C',
                    mycontroller: controller.answerthree,
                  ),
                  AnswerField(
                    hinttext: 'Answer D',
                    mycontroller: controller.answerfour,
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 15.h),
                      child: OptionsGesture(
                        onTap: () => controller.optiontap(context),
                        field: controller.selectedOption,
                        style: controller.statusstyle(
                            'Correct Answer', controller.selectedOption),
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 40.h),
                      alignment: Alignment.center,
                      child: GestureDetector(
                          onTap: () {
                            controller.addFlashcard();
                          },
                          child: Container(
                            width: 120.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: AppColors.third,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Center(
                                child: Text('Add',
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        letterSpacing: 1))),
                          )))
                ],
              );
            })),
      ),
    );
  }
}

class AnswerField extends StatelessWidget {
  final TextEditingController mycontroller;
  final String hinttext;
  const AnswerField({
    super.key,
    required this.mycontroller,
    required this.hinttext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      height: 40.h,
      width: 180.w,
      child: CustomTextFormField(
        mycontroller: mycontroller,
        enabled: true,
        labeltext: hinttext,
      ),
    );
  }
}
