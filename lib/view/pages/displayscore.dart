import 'package:codealpha_flashcard_quiz_app/controller/displayscore_controller.dart';
import 'package:codealpha_flashcard_quiz_app/view/widgets/displayscore/bottomoptions.dart';
import 'package:codealpha_flashcard_quiz_app/view/widgets/displayscore/scoreinfo.dart';
import 'package:codealpha_flashcard_quiz_app/view/widgets/displayscore/yourscore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DisplayScore extends StatelessWidget {
  const DisplayScore({super.key});

  @override
  Widget build(BuildContext context) {
    DisplayscoreController controller = Get.put(DisplayscoreController());
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 500.h,
            child: Stack(
              children: [
                YourScore(
                  score: controller.score(),
                ),
                ScoreInfo(
                  questions: controller.questions.toString(),
                  wrong: controller.wrong.toString(),
                  correct: controller.correct.toString(),
                ),
              ],
            ),
          ),
          const BottomOptions()
        ],
      ),
    );
  }
}
