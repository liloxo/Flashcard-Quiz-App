import 'package:codealpha_flashcard_quiz_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YourScore extends StatelessWidget {
  const YourScore({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          color: AppColors.primaryColor),
      child: Center(
          child: CircleAvatar(
        radius: 85,
        backgroundColor: Colors.white.withOpacity(.3),
        child: CircleAvatar(
          radius: 71,
          backgroundColor: Colors.white.withOpacity(.4),
          child: CircleAvatar(
            radius: 60,
            backgroundColor: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Your Score',
                  style: TextStyle(fontSize: 17.sp, color: AppColors.third),
                ),
                RichText(
                    text: TextSpan(
                        text: '100',
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor),
                        children: [
                      TextSpan(
                          text: ' pt',
                          style: TextStyle(
                              fontSize: 15.sp, color: AppColors.primaryColor))
                    ]))
              ],
            ),
          ),
        ),
      )),
    );
  }
}
