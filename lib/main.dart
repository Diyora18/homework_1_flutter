import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lesson_1/core/client.dart';
import 'package:lesson_1/data/repositories/login_repository.dart';
import 'package:lesson_1/features/authentication/managers/login_view_model.dart';
import 'package:lesson_1/features/recipes/pages/categories_page.dart';
import 'package:provider/provider.dart';

import 'core/route/router.dart';
import 'features/onboarding/pages/cooking_level.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => ApiClient()),
        Provider(
          create: (context) => AuthRepository(apiClient: context.read()),
        ),
        ChangeNotifierProvider<LoginViewModel>(
          create: (context) =>
              LoginViewModel(repository: context.read<AuthRepository>()),
        ),
      ],

      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        routerConfig: MyRouter().router,
        debugShowCheckedModeBanner: true,
      ),
    );
  }
}
