import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lesson_1/features/onboarding/managers/onboarding_view_model.dart';
import 'package:lesson_1/features/recipes/managers/categories_view_model.dart';
import 'package:provider/provider.dart';

import '../widgets/categories_item.dart';
import '../widgets/onboarding_page_text.dart';


class OnboardingPage3 extends StatelessWidget {
  OnboardingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoryViewModel(),
      child: Scaffold(
        backgroundColor: Color(0xFF1C0F0D),
        appBar: AppBar(
          leadingWidth: 80,
          backgroundColor: Color(0xFF1C0F0D),
          leading: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                context.push(("/onboarding2"));
              },
              icon: SvgPicture.asset('assets/arrow.svg'),
            ),
          ),
        ),
        body: Consumer<CategoryViewModel>(
          builder: (context, cv, child) {
            if (cv.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            return Column(
              children: [
                SizedBox(
                  height: 557,
                  child: GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    itemCount: cv.categories.length,

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 190,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      final item = cv.categories[index];
                      return CategoriesItem(
                        id: item.id,
                        title: item.title,
                        image: item.image,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36.0),
                  child: OnboardingPage3Text(),
                ),
                SizedBox(
                  height: 28,
                ),

                Column(
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFFFFC6C9),
                        fixedSize: Size(162, 45),
                      ),

                      onPressed: () {
                        context.push(("/email"));
                      },

                      child: Text(
                        "I'm New",
                        style: TextStyle(color: Colors.pink, fontSize: 20),
                      ),
                    ),
                    SizedBox(height: 18,),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFFFFC6C9),
                        fixedSize: Size(162, 45),
                      ),

                      onPressed: () {},

                      child: Text(
                        "I've Been Here",
                        style: TextStyle(color: Colors.pink, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}