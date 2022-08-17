import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:local_with_pack/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(supportedLocales: const [
    Locale('en', 'US'),
    Locale('uz', 'UZ'),
    Locale('ru', 'RU')
  ], path: 'assets/translations', child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      ///birinchi usul
      ///locale: EasyLocalization.of(context)!.currentLocale,
      ///ikkinchi usul
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      home: const HomePage(),
    );
  }
}
