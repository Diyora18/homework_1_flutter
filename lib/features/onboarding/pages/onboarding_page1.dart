import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lesson_1/core/route/router.dart';
import 'package:lesson_1/features/onboarding/managers/onboarding_view_model.dart';
import 'package:lesson_1/features/recipes/widgets/continue_button.dart';
import 'package:lesson_1/features/onboarding/widgets/onboarding_texts.dart';
import 'package:provider/provider.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnBoardingViewModel(1),
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(backgroundColor: Color(0xFF1C0F0D)),
        backgroundColor: Color(0xFF1C0F0D),
        body: Consumer<OnBoardingViewModel>(
          builder: (context, vm, child) {
            if (vm.isLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (vm.images == null) {
              return Center(child: Text("Image kelmadi"));
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 37),
                  child: OnBoardingTexts(
                    text1: "Get Inspired",
                    text2: 'Get inspired with our daily recipe recommendations',
                  ),
                ),
                SizedBox(height: 30.h),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 720.h,
                    child: Stack(
                      children: [
                        Image.network(vm.images!.image, fit: BoxFit.cover),
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.center,

                              colors: [
                                Colors.black.withAlpha(5),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        bottomNavigationBar: Align(
          alignment: Alignment.bottomCenter,
          child: ContinueButton(
            onpressed: () {
              context.push("/onboarding2");
            },
          ),
        ),
      ),
    );
  }
}
