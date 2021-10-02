import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shootingtrack/di/di.dart';
import 'package:shootingtrack/presentation/main_navigation_drawer.dart';
import 'package:shootingtrack/presentation/weapon/weapon_page.dart';
import 'package:shootingtrack/presentation/weapons_list/widgets/weapon_list.dart';

import 'bloc/weapon_list_cubit.dart';
import 'bloc/weapon_list_state.dart';


class WeaponListPage extends StatelessWidget {
  const WeaponListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeaponListCubit>(
      create: (BuildContext context) => WeaponListCubit(
        weaponsRepository: getIt.get(),
      )..onInit(),
      child: const WeaponListWidget(),
    );
  }
}

class WeaponListWidget extends StatefulWidget {
  const WeaponListWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WeaponListWidgetState();
}

class _WeaponListWidgetState extends State<WeaponListWidget> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(AppLocalizations.of(context)!.weaponsListTitle),
    ),
    drawer: const MainNavigationDrawer(),
    floatingActionButton: FloatingActionButton(
      tooltip: AppLocalizations.of(context)!.addWeaponTitle,
      child: const Icon(Icons.add),
      onPressed: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const WeaponPage(),
      )),
    ),
    body: BlocBuilder<WeaponListCubit, WeaponListState>(
      builder: (BuildContext context, WeaponListState state) {
        return WeaponList<Success>(
          state: state,
        );
      }),
  );
}