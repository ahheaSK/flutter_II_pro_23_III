import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_23/binding/auth_binding.dart';
import 'package:pro_23/binding/initial_binding.dart';
import 'package:pro_23/binding/post_binding.dart';
import 'package:pro_23/core/translation/app_translation.dart';
import 'package:pro_23/screen/auth/login_screen.dart';
import 'package:pro_23/screen/main_screen.dart';
import 'package:pro_23/screen/post/post_form_screen.dart';
import 'package:pro_23/screen/post/post_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),

      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      translations: AppTranslation(),
      initialBinding: InitialBinding(),
      getPages: [
        GetPage(name: '/', page: () => const MainScreen()),
        GetPage(
          name: '/login',
          page: () => const LoginScreen(),
          binding: AuthBinding(),
        ),
        GetPage(name: '/post-list', page: () => const PostListScreenScreen()),
        GetPage(
          name: '/post-create',
          page: () => const PostFormScreen(),
          binding: PostBinding(),
        ),
      ],
      initialRoute: '/login',
    );
  }
}
