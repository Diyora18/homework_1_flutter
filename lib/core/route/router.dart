import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:lesson_1/features/onboarding/pages/cooking_level.dart';
import 'package:lesson_1/features/onboarding/pages/onboarding_page2.dart';
import 'package:lesson_1/features/onboarding/pages/onboarding_page3.dart';
import 'package:lesson_1/features/recipes/pages/recipe_detail_page.dart';
import 'package:lesson_1/features/recipes/pages/recipe_page.dart';

import '../../features/onboarding/pages/onboarding_page1.dart';
import '../../features/onboarding/pages/allergic_page.dart';
import '../../features/onboarding/pages/cuisine_page.dart';
import '../../features/onboarding/pages/page_view.dart';
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
        builder: (context, state) =>
            RecipeDetailPage(recipeId: int.parse(state.pathParameters['id']!)),
      ),
      GoRoute(path: "/cuisinePage", builder: (context, state) => CuisinePage()),
      GoRoute(
        path: "/allergicPage",
        builder: (context, state) => AllergicPage(),
      ),
      GoRoute(
        path: "/cookingLevelPage",
        builder: (context, state) => CookingPage(),
      ),
      GoRoute(
        path: "/onboarding1",
        builder: (context, state) => OnboardingPage1(),
      ),
      GoRoute(
        path: "/onboarding2",
        builder: (context, state) => OnboardingPage2(),
      ),
      GoRoute(
        path: "/onboarding3",
        builder: (context, state) => OnboardingPage3(),
      ),
      GoRoute(path: "/levels", builder: (context, state) => CookingPage()),
      GoRoute(
        path: "/pageview",
        builder: (context, state) => OnboardingScreen(),
      ),
    ],
  );
}
