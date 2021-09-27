import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'pages/weapons_list_page.dart';

void main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (BuildContext context) => AppLocalizations.of(context)!.appName,
      title: 'Shooting Track',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme(
          primary: Color(0xffcfd8dc),
          primaryVariant: Color(0xff9ea7aa),
          onPrimary: Color(0xff000000),
          secondary: Color(0xffb0bec5),
          secondaryVariant: Color(0xff808e95),
          onSecondary: Color(0xff000000),
          surface: Color(0xffffffff),
          onSurface: Color(0xff000000),
          background: Color(0xffffffff),
          onBackground: Color(0xff000000),
          error: Color(0xffb00020),
          onError: Color(0xffffffff),
          brightness: Brightness.light
        ),
      ),
      home: const WeaponsListPage(),
    );
  }
}
