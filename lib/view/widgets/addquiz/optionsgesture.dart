import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/colors.dart';

class OptionsGesture extends StatelessWidget {
  final void Function()? onTap;
  final String field;
  final TextStyle? style;
  final IconData? icon;
  const OptionsGesture(
      {Key? key, this.onTap, required this.field, this.style, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.only(right: 15.w),
          height: 40.h,
          width: 180.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.grey, width: 1)),
          child: SizedBox(
              width: 150.w, child: Center(child: Text(field, style: style))),
        ));
  }
}
