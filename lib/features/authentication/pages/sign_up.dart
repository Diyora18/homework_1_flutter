import 'package:flutter/material.dart';
import 'package:lesson_1/core/utils/app_colors.dart';
import 'package:lesson_1/features/authentication/widgets/reusable_textformfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final birthdayController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        title: Text(
          "Sign Up",
          style: TextStyle(
            color: AppColors.leadingPink,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 106),
        child: Column(
          children: [
            ReusableTextForm(
              labelText: "Full Name",
              hintText: "John Doe",
              controller: fullNameController,
            ),
            SizedBox(height: 9),
            ReusableTextForm(
              labelText: "Email",
              hintText: "example@example.com",
              controller: emailController,
            ),
            SizedBox(height: 9),
            ReusableTextForm(
              labelText: "Mobile Number",
              hintText: "+ 123 456 789",
              controller: numberController,
            ),
            SizedBox(height: 9),
            ReusableTextForm(
              labelText: "Date Of Birth",
              hintText: "DD/MM/YY",
              controller: birthdayController,
            ),
            SizedBox(height: 9),
            ReusableTextForm(
              labelText: "Password",
              hintText: "********",
              controller: passwordController,
              isPassword: true,
            ),
            SizedBox(height: 9),
            ReusableTextForm(
              labelText: "Confirm Password",
              hintText: "********",
              controller: confirmController,
              isPassword: true,
            ),
            SizedBox(height: 48),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 180,
                  child: Text(
                    "By continuing, you agree to Terms of Use and Privacy Policy.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 2,
                  ),
                ),
                SizedBox(height: 12),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.leadingPink,
                    fixedSize: Size(194, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppColors.leadingPink,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
