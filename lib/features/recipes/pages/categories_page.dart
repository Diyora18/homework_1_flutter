import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lesson_1/features/common/bottom_navigation_bar.dart';
import 'package:lesson_1/features/recipes/managers/categories_view_model.dart';
import 'package:lesson_1/features/recipes/pages/recipe_page.dart';
import 'package:provider/provider.dart';

import 'recipe_detail_page.dart';

class CategoriesPage extends StatelessWidget {


  const CategoriesPage({super.key, });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoriesViewModel(),
      builder: (context, child) => Scaffold(
        backgroundColor: Color(0xFF1C0F0D),
        appBar: AppBar(
          backgroundColor: Color(0xFF1C0F0D),
          leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/arrow.svg"),
          ),
          centerTitle: true,
          title: Text(
            "Categories",
            style: TextStyle(
              color: Color(0xFFFD5D69),
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          actions: [
            SizedBox(
              width: 28,
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/notification.svg"),
                constraints: BoxConstraints.tight(Size.square(28)),
                padding: EdgeInsets.zero,
                style: IconButton.styleFrom(
                  backgroundColor: Color(0xFFFFC6C9),
                  padding: EdgeInsets.zero,
                ),
              ),
            ),

            SizedBox(
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/search.svg"),
                constraints: BoxConstraints.tight(Size.square(28)),
                style: IconButton.styleFrom(
                  backgroundColor: Color(0xFFFFC6C9),
                  padding: EdgeInsets.zero,
                ),
              ),
            ),
          ],
        ),
        body: Consumer<CategoriesViewModel>(
          builder: (context, vm, child) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: 172,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipesPage(
                        categoryId: vm.categories[index].id,
                        title: vm.categories[index].title,
                        selectedIndex: vm.categories[index].id,
                      ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(13),
                      child: Image.network(
                        vm.categories[index].image,
                        fit: BoxFit.cover,
                        width: 159,
                        height: 145,
                      ),
                    ),
                    Text(
                      vm.categories[index].title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              itemCount: vm.categories.length,
            );
          },
        ),
        bottomNavigationBar: BottomNavigator(),
      ),
    );
  }
}
