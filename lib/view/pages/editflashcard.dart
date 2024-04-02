import 'package:codealpha_flashcard_quiz_app/controller/editflashcard_controller.dart';
import 'package:codealpha_flashcard_quiz_app/core/components/customtextformfield.dart';
import 'package:codealpha_flashcard_quiz_app/core/constants/colors.dart';
import 'package:codealpha_flashcard_quiz_app/view/pages/addflashcard.dart';
import 'package:codealpha_flashcard_quiz_app/view/widgets/addquiz/optionsgesture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditFlashCard extends StatelessWidget {
  const EditFlashCard({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditFlashcardController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.h,
        foregroundColor: Colors.white,
        backgroundColor: AppColors.third,
        title: Text(
          'Edit FlashCard',
          style: TextStyle(
              fontWeight: FontWeight.w700, letterSpacing: 2, fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: GetBuilder<EditFlashcardController>(builder: (controller) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
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
                    field: controller.selectedOptions,
                    style: controller.statusstyle(
                        'Correct Answer', controller.selectedOptions),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 40.h),
                  alignment: Alignment.center,
                  child: GestureDetector(
                      onTap: () {
                        controller.editcard();
                      },
                      child: Container(
                        width: 120.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: AppColors.third,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                            child: Text('Edit',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    letterSpacing: 1))),
                      )))
            ],
          ),
        );
      })),
    );
  }
}
