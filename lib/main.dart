import 'package:flutter/material.dart';
import 'package:lesson_1/features/recipes/pages/categories_page.dart';

import 'core/route/router.dart';
import 'features/onboarding/pages/cooking_level.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: MyRouter().router,
    debugShowCheckedModeBanner: true,
    );
  }
}
