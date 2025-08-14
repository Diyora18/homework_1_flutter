import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:lesson_1/features/authentication/pages/login.dart';
import 'package:lesson_1/features/authentication/pages/password.dart';
import 'package:lesson_1/features/onboarding/pages/cooking_level.dart';
import 'package:lesson_1/features/authentication/pages/email.dart';
import 'package:lesson_1/features/onboarding/pages/onboarding_page2.dart';
import 'package:lesson_1/features/onboarding/pages/onboarding_page3.dart';
import 'package:lesson_1/features/recipes/pages/recipe_detail_page.dart';
import 'package:lesson_1/features/recipes/pages/recipe_page.dart';

import '../../features/authentication/pages/sign_up.dart';
import '../../features/onboarding/pages/onboarding_page1.dart';
import '../../features/onboarding/pages/allergic_page.dart';
import '../../features/onboarding/pages/cuisine_page.dart';
import '../../features/onboarding/pages/page_view.dart';
import '../../features/recipes/pages/categories_page.dart';

class MyRouter {
  GoRouter router = GoRouter(
    initialLocation: "/login",

    routes: [
      GoRoute(
        path: "/recipe-detail",
        builder: (context, state) => CategoryDetailPagee(
          categoryId: int.parse(state.pathParameters['categoryId']!),
          title: state.pathParameters['title']!,
        ),
      ),


      GoRoute(
        path: "/categories",
        builder: (context, state) => CategoriesPage(),
      ),
      GoRoute(
        path: "/category-detail/:id",
        builder: (context, state) {
          final id =int.parse(state.pathParameters['id']!);
          final title=Uri.decodeComponent(state.pathParameters['title']!);

          final rating=num.parse(state.pathParameters['rating']!);

          return CategoryDetailsRecipe(recipeId: id, title: title, rating: rating);
        }

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
      GoRoute(
          path: "/email",
          builder: (context, state) => EmailPage(),
      ),
      GoRoute(
        path: "/password",
        builder: (context, state) => PasswordPage(),
      ),
      GoRoute(
        path: "/login",
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: "/signup",
        builder: (context, state) => SignUpPage(),
      ),
    ],
  );

}
