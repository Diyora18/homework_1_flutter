import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:lesson_1/features/onboarding/pages/cooking_level.dart';
import 'package:lesson_1/features/recipes/pages/recipe_detail_page.dart';
import 'package:lesson_1/features/recipes/pages/recipe_page.dart';

import '../../features/onboarding/pages/allergic_page.dart';
import '../../features/onboarding/pages/cuisine_page.dart';
import '../../features/recipes/pages/categories_page.dart';

class MyRouter {
  GoRouter router = GoRouter(
    redirect: (context, state) {},
    initialLocation: '/cookingLevelPage',

    routes: [
      GoRoute(
        path: "/recipe-detail",
        builder: (context, state) => RecipesPage(
          categoryId: int.parse(state.pathParameters['categoryId']!),
          title: state.pathParameters['title']!,
          selectedIndex: int.parse(state.pathParameters['selectedIndex']!),
        ),
      ),

      GoRoute(
        path: "/categories",
        builder: (context, state) => CategoriesPage(),
      ),
      GoRoute(
        path: "/category-detail/:id",
        builder: (context, state) => RecipeDetailPage(
          recipeId: int.parse(state.pathParameters['id']!),

        ),
      ),
      GoRoute(path: "/cuisinePage",
      builder: (context, state) => CuisinePage(),
      ),
      GoRoute(path: "/allergicPage",
        builder: (context, state) => AllergicPage(),),
      GoRoute(path: "/cookingLevelPage",
        builder: (context, state) => CookingPage(),),
    ],
  );
}
