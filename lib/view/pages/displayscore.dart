import 'package:codealpha_flashcard_quiz_app/view/widgets/displayscore/bottomoptions.dart';
import 'package:codealpha_flashcard_quiz_app/view/widgets/displayscore/scoreinfo.dart';
import 'package:codealpha_flashcard_quiz_app/view/widgets/displayscore/yourscore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayScore extends StatelessWidget {
  const DisplayScore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 500.h,
            child: const Stack(
              children: [
                YourScore(),
                ScoreInfo(),
              ],
            ),
          ),
          const BottomOptions()
        ],
      ),
    );
  }
}
