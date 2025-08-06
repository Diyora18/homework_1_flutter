import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../recipes/managers/categories_view_model.dart';
import '../recipes/managers/recipes_view_model.dart';
import '../recipes/widgets/bottom_item.dart';

class RecipeAppBarBottom extends StatelessWidget
    implements PreferredSizeWidget {
  const RecipeAppBarBottom({super.key, });



  @override
  Size get preferredSize => Size(double.infinity, 91);

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipesViewModel>(
      builder: (context, vm, child) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              children: List.generate(
                vm.categories.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: BottomItem(
                    id: vm.categories[index].id,
                    title: vm.categories[index].title,
                    isSelected: vm.categories[index].id == vm.categoryId,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
