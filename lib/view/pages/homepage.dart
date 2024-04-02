import 'package:codealpha_flashcard_quiz_app/controller/homepage_controller.dart';
import 'package:codealpha_flashcard_quiz_app/core/class/handlingdataview.dart';
import 'package:codealpha_flashcard_quiz_app/core/constants/colors.dart';
import 'package:codealpha_flashcard_quiz_app/view/widgets/homepage/flashcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomepageController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('add');
        },
        backgroundColor: AppColors.third,
        child: const Icon(
          Icons.card_giftcard,
          color: Colors.white,
        ),
      ),
      backgroundColor: AppColors.third,
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(bottom: 20.h, left: 20.w),
            height: 125.h,
            child: Text(
              'QuizMeister',
              style: TextStyle(
                  fontSize: 20.h,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,
                  color: Colors.white),
            ),
          ),
          Expanded(child: GetBuilder<HomepageController>(builder: (controller) {
            return Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 10.h),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Start Quiz',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 2,
                                    color: AppColors.secondaryColor),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Get.toNamed('startquiz', arguments: {
                                      'cards': controller.flashcards
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward,
                                    size: 30,
                                    color: AppColors.secondaryColor,
                                  ))
                            ],
                          ),
                          ListView.builder(
                              padding: EdgeInsets.only(top: 5.h),
                              shrinkWrap: true,
                              itemCount: controller.flashcards?.length,
                              itemBuilder: (context, i) {
                                return Dismissible(
                                  onDismissed: (direction) {
                                    controller.deletecard(
                                        controller.flashcards![i].id!);
                                    controller.flashcards!.removeAt(i);
                                  },
                                  background: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    margin: EdgeInsets.symmetric(vertical: 8.h),
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  key: ValueKey(controller.flashcards![i]),
                                  child: Flashcard(
                                    onTap: () => Get.toNamed('edit',
                                        arguments: {
                                          'card': controller.flashcards![i]
                                        }),
                                    i: i + 1,
                                    question:
                                        controller.flashcards![i].question!,
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                    loading: const Center(
                        child: CircularProgressIndicator(
                      color: AppColors.third,
                    ))));
          }))
        ],
      ),
    );
  }
}
