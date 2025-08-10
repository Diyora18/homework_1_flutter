import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lesson_1/core/route/router.dart';

import 'package:provider/provider.dart';

import '../../recipes/widgets/continue_button.dart';
import '../managers/onboarding_view_model.dart';
import '../widgets/onboarding_texts.dart';


class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnBoardingViewModel(2),

      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          leadingWidth: 74.w,
          backgroundColor: Color(0xFF1C0F0D),
          leading: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                context.push(("/onboarding1"));
              },
              icon: SvgPicture.asset('assets/arrow.svg'),
            ),
          ),
        ),
        backgroundColor: Color(0xFF1C0F0D),
        body: Consumer<OnBoardingViewModel>(
          builder: (context, vm, child) {
            if (vm.isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (vm.images == null) {
              return Center(
                child: Text("Image kelmadi"),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 37.0),
                  child: OnBoardingTexts(
                    text1: 'Get an increase your skills',
                    text2:
                    'Learn essential cooking techniques at your own pace.',
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 741.h,
                    child: Stack(
                      children: [
                        Image.network(
                          vm.images!.image,
                          fit: BoxFit.cover,
                        ),
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
              context.push("/onboarding3");
            },
          ),
        ),
      ),
    );
  }

}