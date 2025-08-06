import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:lesson_1/features/recipes/pages/recipe_detail_page.dart';
import 'package:lesson_1/features/recipes/pages/recipe_page.dart';

import '../../features/recipes/pages/categories_page.dart';

class Router {
  GoRouter router = GoRouter(
    redirect: (context, state) {},
    initialLocation: '/categories',

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
    ],
  );
}
