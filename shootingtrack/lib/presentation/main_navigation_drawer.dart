import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shootingtrack/presentation/shooting_record_list/shooting_record_list.dart';
import 'package:shootingtrack/presentation/weapon_list/weapon_list_page.dart';

class MainNavigationDrawer extends StatelessWidget {
  const MainNavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).colorScheme.onPrimary;
    final appLocalizations = AppLocalizations.of(context)!;

    return Drawer(
          child: Material(
              child: ListView(
                children: <Widget>[
                  buildMenuItem(
                      title: appLocalizations.weaponsListTitle,
                      icon: Icons.construction_outlined,
                      contentColor: contentColor,
                      onTap: () => selectedItem(context, 0)
                  ),
                  buildMenuItem(
                      title: appLocalizations.recordsListTitle,
                      icon: Icons.add_circle_outline,
                      contentColor: contentColor,
                      onTap: () => selectedItem(context, 1)
                  ),
                ],
              )
          )
      );
  }

  Widget buildMenuItem({
    required String title,
    required IconData icon,
    required Color contentColor,
    required VoidCallback onTap,
  }) {

    return ListTile(
      leading: Icon(icon, color: contentColor),
      title: Text(title),
      onTap: onTap,
    );
  }

  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const WeaponListPage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ShootingRecordListPage(),
        ));
        break;
    }
  }
}
