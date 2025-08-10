import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lesson_1/features/onboarding/managers/cuisine_view_model.dart';
import 'package:provider/provider.dart';

import '../widgets/category_cuisines.dart';

class AllergicPage extends StatelessWidget {
  const AllergicPage({super.key});

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
              context.push('/cuisinePage');
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
                  alignment: Alignment.centerRight,
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
                        "¿You have any allergic?",
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
                          "Lorem ipsum dolor sit amet consectetur. Leo ornare ullamcorper viverra ultrices in.",
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
                          mainAxisExtent: 145,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 15,
                        ),
                        itemBuilder: (context, index) => CategoryCuisines(
                          id: vm.cuisines[index].id,
                          title: vm.cuisines[index].title,
                          image: vm.cuisines[index].image,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFFFD5D69),
                          fixedSize: Size(162, 45),
                        ),
                        onPressed: () {
                          context.push("/onboarding1");
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
