import 'package:codealpha_flashcard_quiz_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScoreInfo extends StatelessWidget {
  const ScoreInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 90.h,
        left: 15.w,
        child: Container(
          padding: EdgeInsets.only(left: 20.w),
          height: 180.h,
          width: 330.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 3,
                    color: AppColors.third.withOpacity(.7),
                    offset: const Offset(0, 1))
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 180.w,
                    child: const ScoreFeature(
                      data: '100%',
                      title: 'Completed',
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const ScoreFeature(
                    data: '10',
                    title: 'Total Questions',
                    color: AppColors.secondaryColor,
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 180.w,
                    child: const ScoreFeature(
                      data: '3',
                      title: 'wrong',
                      color: Colors.red,
                    ),
                  ),
                  const ScoreFeature(
                    data: '7',
                    title: 'Correct',
                    color: Colors.green,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class ScoreFeature extends StatelessWidget {
  final Color? color;
  final String data;
  final String title;
  const ScoreFeature(
      {super.key, this.color, required this.data, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 15.h,
              width: 15.w,
              decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            ),
            Text(
              ' $data',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.sp),
            )
          ],
        ),
        Text(
          title,
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
