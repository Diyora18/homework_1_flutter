import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lesson_1/features/common/app_bar.dart';
import 'package:lesson_1/features/recipes/managers/recipes_view_model.dart';
import 'package:lesson_1/features/recipes/widgets/recipe_item.dart';
import 'package:provider/provider.dart';

import 'recipe_detail_page.dart';

class RecipesPage extends StatelessWidget {
  final int categoryId;
  final String title;
  final int selectedIndex;

  const RecipesPage({
    super.key,
    required this.categoryId,
    required this.title,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecipesViewModel(categoryId: categoryId),
      child: Consumer<RecipesViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }

          if (vm.error != null) {
            return Scaffold(body: Center(child: Text(vm.error!)));
          }

          return Scaffold(
            backgroundColor: Color(0xFF1C0F0D),
            appBar: CustomAppBar(
              title: title,
              actions: [
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Color(0xFFFFC6C9),
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  constraints: BoxConstraints.tight(Size(28, 28)),
                  icon: SvgPicture.asset("assets/notification.svg"),
                  onPressed: () {},
                ),
                SizedBox(width: 5),
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Color(0xFFFFC6C9),
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  constraints: BoxConstraints.tight(Size(28, 28)),
                  icon: SvgPicture.asset("assets/search.svg"),
                  onPressed: () {},
                ),
              ],
              selectedIndex: selectedIndex,
            ),
            body: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 19,
                mainAxisSpacing: 30,
                mainAxisExtent: 226,
              ),
              itemCount: vm.recipes.length,
              itemBuilder: (context, index) {
                final recipe = vm.recipes[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailPage(
                          recipeId: recipe['id'],
                        ),
                      ),
                    );
                  },
                  child: RecipeItem(recipe: recipe),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
