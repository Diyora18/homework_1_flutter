import 'package:go_router/go_router.dart';
import 'package:lesson_1/core/utils/app_colors.dart';
import 'package:lesson_1/features/authentication/managers/login_view_model.dart';
import 'package:lesson_1/features/authentication/widgets/reusable_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C0F0D),
      appBar: AppBar(
        backgroundColor: Color(0xFF1C0F0D),
        centerTitle: true,
        title: Text(
          "Login",
          style: TextStyle(
            color: Color(0xFFFD5D69),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Consumer<LoginViewModel>(
        builder: (contex, vm, child) {
          return Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.only(top: 152, left: 24, right: 24),
              child: Column(
                children: [
                  ReusableTextForm(
                    labelText: "Email",
                    hintText: "example@example.com",
                    controller: emailController,
                  ),
                  SizedBox(height: 10),
                  ReusableTextForm(
                    labelText: "Password",
                    hintText: '*******',
                    controller: passwordController,
                    isPassword: true,
                  ),

                  SizedBox(height: 89),
                  vm.isLoading
                      ? const CircularProgressIndicator()
                      : TextButton(
                          style: TextButton.styleFrom(
                            fixedSize: Size(207, 45),
                            backgroundColor: AppColors.pink,
                          ),
                          onPressed: () async {
                            final success = await vm.login(
                              emailController.text,
                              passwordController.text,
                            );
                            if (success) {
                              context.push("/categories");
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(vm.error ?? "Login xatolik"),
                                ),
                              );
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Color(0xFFEC888D),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                  SizedBox(height: 27),
                  TextButton(
                    style: TextButton.styleFrom(
                      fixedSize: Size(207, 45),
                      backgroundColor: Color(0xFFFFC6C9),
                    ),
                    onPressed: () {
                      context.push("/signup");
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color(0xFFEC888D),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 58),
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 73),
                  Text(
                    "Or sign up with",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 26),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 13,
                    children: [
                      SvgPicture.asset("assets/inst.svg"),
                      SvgPicture.asset("assets/google.svg"),
                      SvgPicture.asset("assets/facebook.svg"),
                      SvgPicture.asset("assets/wats.svg"),
                    ],
                  ),
                  SizedBox(height: 41),
                  Text(
                    "Don't have an account? Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
