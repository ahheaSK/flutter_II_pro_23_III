import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_23/binding/initial_binding.dart';
import 'package:pro_23/core/translation/app_translation.dart';
import 'package:pro_23/router/app_page.dart';

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
      getPages: AppPage.pages,
      initialRoute: '/login',
    );
  }
}
