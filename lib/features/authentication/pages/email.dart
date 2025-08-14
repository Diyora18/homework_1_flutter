import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/app_colors.dart';

class EmailPage extends StatelessWidget {
  const EmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C0F0D),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF1C0F0D),
        centerTitle: true,
        title: Text(
          "Forgot Your Password",
          style: TextStyle(
            color: AppColors.leadingPink,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello There!",
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: 345.w,
              child: Text(
                "Enter your email address. We will send a code verification in the next step.",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
                maxLines: 2,
              ),
            ),
            SizedBox(height: 69.h),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.pink,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
                hintText: 'example@example.com',
                hintStyle: TextStyle(
                  color: AppColors.background,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 511.h),
            Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.pink,
                  fixedSize: Size(207.w, 45.h),
                ),
                onPressed: () {
                  context.push("/password");
                },
                child: Text(
                  "Continue",
                  style: TextStyle(
                    color: AppColors.pink2,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
