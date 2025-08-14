import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lesson_1/core/utils/app_colors.dart';
import 'package:lesson_1/features/authentication/widgets/entering_password.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background,
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
        padding: const EdgeInsets.only(left: 24, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "You've Got Mail",
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 300.w,
              child: Text(
                "We will send you the verification code to your email address, check your email and put the code right below .",
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
                maxLines: 3,
              ),
            ),
            SizedBox(height: 50),

          ],
        ),
      ),
    );
  }
}
