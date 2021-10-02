import 'package:flutter/material.dart';
import 'package:shootingtrack/data/data.dart';
import 'package:shootingtrack/dimens.dart';
import 'package:shootingtrack/presentation/weapon/weapon_page.dart';

class WeaponItem extends StatelessWidget {
  WeaponItem(
    this.weapon,
  ) : super(key: Key(weapon.id));

  final Weapon weapon;

  @override
  Widget build(BuildContext context) {
    final String title = weapon.name;
    final String subtitle = [
      weapon.manufacturer.name,
      weapon.model.name,
      weapon.gauge.name,
    ]
    .join(", ");

    return Card(
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => WeaponPage(weaponId: weapon.id),
        )),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: Dimens.halfBaseMargin,
            horizontal: Dimens.baseMargin),
          child: ListTile(
            title: Text(title),
            subtitle: Text(subtitle),
          )
        ),
      ),
    );
  }
}