import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shootingtrack/pages/main_navigation_drawer.dart';

class WeaponsListPage extends StatefulWidget {
  const WeaponsListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WeaponsListPageState();

}

class _WeaponsListPageState extends State<WeaponsListPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(AppLocalizations.of(context)!.weaponsListTitle),
    ),
    drawer: MainNavigationDrawer(),
  );
}