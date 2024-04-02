import 'package:codealpha_flashcard_quiz_app/controller/startquiz_controller.dart';
import 'package:codealpha_flashcard_quiz_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StartQuiz extends StatelessWidget {
  const StartQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(StartquizController());
    return Scaffold(
        body: GetBuilder<StartquizController>(builder: (controller) {
      return Container(
        margin: EdgeInsets.all(15.h),
        child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller.pageController,
            onPageChanged: (val) {
              controller.onPageChanged(val);
            },
            itemCount: controller.flashcards.length,
            itemBuilder: (context, i) {
              List<String> opts = [
                "A.${controller.flashcards[i].answerone!}",
                "B.${controller.flashcards[i].answertwo!}",
                "C.${controller.flashcards[i].answerthree!}",
                "D.${controller.flashcards[i].answerfour!}",
              ];
              return Column(
                children: [
                  SizedBox(height: 50.h),
                  SizedBox(
                    child: Center(
                        child: Text(
                      'Question ${i + 1}',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w700),
                    )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30.h, bottom: 10.h),
                    padding: EdgeInsets.all(15.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(width: 1, color: AppColors.grey)),
                    child: Text(
                      controller.flashcards[i].question!,
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w700),
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: opts.length,
                      itemBuilder: (context, index) {
                        return OptionsContainer(
                          onTap: () => controller.selectOpt(index, opts[index]),
                          option: opts[index],
                          isChose: controller.whentap[index],
                        );
                      }),
                  Container(
                    margin: EdgeInsets.only(top: 25.h),
                    height: 40.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: InkWell(
                      onTap: () {
                        controller.next(i);
                      },
                      child: Center(
                        child: Text(
                          controller.flashcards.length == i + 1
                              ? 'End Quiz'
                              : 'Next Question',
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.5,
                              color: controller.flashcards.length == i + 1
                                  ? Colors.red
                                  : Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              );
            }),
      );
    }));
  }
}

class OptionsContainer extends StatelessWidget {
  final String option;
  final bool isChose;
  final void Function()? onTap;
  const OptionsContainer({
    super.key,
    required this.isChose,
    required this.option,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 20.h),
        padding: EdgeInsets.all(15.h),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: isChose ? AppColors.third : null,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1, color: AppColors.grey)),
        child: Text(
          option,
          style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: isChose ? Colors.white : null),
        ),
      ),
    );
  }
}
