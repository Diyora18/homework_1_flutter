import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lesson_1/core/utils/app_colors.dart';

class EnteringPassword extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  const EnteringPassword({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      textAlign: TextAlign.center,
      maxLength: 1,
      style: TextStyle(color: AppColors.white, fontSize: 18.sp),
      decoration: InputDecoration(
        constraints: BoxConstraints.tight(Size.square(40.r)),
        counterText: "",
        contentPadding: EdgeInsets.zero,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: AppColors.leadingPink),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: AppColors.leadingPink),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: AppColors.leadingPink),
        ),
      ),
    );
  }
}
