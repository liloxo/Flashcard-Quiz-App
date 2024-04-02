import 'package:codealpha_flashcard_quiz_app/controller/displayscore_controller.dart';
import 'package:codealpha_flashcard_quiz_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomOptions extends GetView<DisplayscoreController> {
  const BottomOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        OptionButton(
          data: 'Home',
          onTap: () {
            Get.offAllNamed('/');
          },
          icon: Icons.home,
          backgroundColor: AppColors.primaryColor,
        ),
        OptionButton(
          data: 'Quiz Again',
          onTap: () {
            Get.offNamed('startquiz',
                arguments: {'cards': controller.flashcards});
          },
          icon: Icons.restart_alt,
          backgroundColor: AppColors.secondaryColor,
        ),
      ],
    );
  }
}

class OptionButton extends StatelessWidget {
  final void Function()? onTap;
  final Color? backgroundColor;
  final IconData? icon;
  final String data;
  const OptionButton({
    super.key,
    this.onTap,
    this.backgroundColor,
    this.icon,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: backgroundColor,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            data,
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
