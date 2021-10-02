import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shootingtrack/presentation/main_navigation_drawer.dart';
import 'package:shootingtrack/presentation/weapon/weapon_page.dart';


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
    floatingActionButton: FloatingActionButton(
      tooltip: AppLocalizations.of(context)!.addWeaponTitle,
      child: const Icon(Icons.add),
      onPressed: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => WeaponPage(),
      )),
    ),
  );
}