import 'package:flutter/material.dart';
import 'package:lesson_1/core/models/home/recipe_detail_model.dart';

import 'categories_card.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({super.key, required this.recipe});

  final DetailModel recipe;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 169,
        height: 226,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            CategoriesCard(
              image: recipe.image,
              textName: recipe.textname,
              textDetail: recipe.textdetail,
              textMinute: recipe.textminute,
              textStar: recipe.textstar,
            ),
          ],
        ),
      ),
    );
  }
}
