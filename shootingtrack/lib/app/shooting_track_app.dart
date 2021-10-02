import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shootingtrack/presentation/weapon_list/weapon_list_page.dart';

class ShootingTrackApp extends StatelessWidget {
  const ShootingTrackApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (BuildContext context) => AppLocalizations.of(context)!.appName,
      title: 'Shooting Track',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: const ColorScheme(
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
      home: const WeaponListPage(),
    );
  }
}