import 'package:codealpha_flashcard_quiz_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Flashcard extends StatelessWidget {
  final String question;
  final int i;
  final void Function()? onTap;

  const Flashcard({
    Key? key,
    required this.question,
    required this.i,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: AppColors.third,
        elevation: 2,
        margin: EdgeInsets.symmetric(vertical: 8.h),
        child: Padding(
          padding: EdgeInsets.all(16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Question $i:',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    fontSize: 18.sp,
                    color: Colors.white),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.h, bottom: 16.h),
                padding: EdgeInsets.only(right: 5.w),
                child: Text(
                  question,
                  style: TextStyle(
                      fontSize: 17.sp,
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis),
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
