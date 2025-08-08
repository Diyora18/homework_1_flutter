import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lesson_1/features/onboarding/managers/cuisine_view_model.dart';
import 'package:lesson_1/features/onboarding/widgets/category_cuisines.dart';
import 'package:provider/provider.dart';

class CuisinePage extends StatelessWidget {
  const CuisinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CuisineViewModel(),
      child: Scaffold(
        backgroundColor: Color(0xFF1C0F0D),
        appBar: AppBar(
          backgroundColor: Color(0xFF1C0F0D),
          leading: IconButton(
            onPressed: () {
              context.push("/cookingLevelPage");
            },
            icon: SvgPicture.asset("assets/arrow.svg"),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(55),
            child: Padding(
              padding: EdgeInsets.only(bottom: 45),
              child: Container(
                width: 230,
                height: 12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 65,
                    height: 12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color(0xFFFD5D69),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 36),
          child: Consumer<CuisineViewModel>(
            builder: (context, vm, child) {
              return Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select your cuisines preferences",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: 356,
                        child: Text(
                          "Please select your cuisines preferences for a better recommendations or you can skip it.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Center(
                      child: GridView.builder(
                        itemCount: vm.cuisines.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 15,
                          mainAxisExtent: 145,
                        ),
                        itemBuilder: (context, index) => CategoryCuisines(
                          id: vm.cuisines[index].id,
                          title: vm.cuisines[index].title,
                          image: vm.cuisines[index].image,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(bottom: 40),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xFFFFC6C9),
                            fixedSize: Size(162, 45),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Skip",
                            style: TextStyle(
                              color: Color(0xFFEC888D),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(width: 32,),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xFFFD5D69),
                            fixedSize: Size(162, 45),
                          ),
                          onPressed: () {
                            context.push("/allergicPage");
                          },
                          child: Text(
                            "Continue",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
