import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shootingtrack/di/di.dart';
import 'package:shootingtrack/presentation/main_navigation_drawer.dart';
import 'package:shootingtrack/presentation/weapon/weapon_page.dart';
import 'package:shootingtrack/presentation/weapon_list/widgets/weapon_list.dart';

import 'bloc/weapon_list_cubit.dart';
import 'bloc/weapon_list_state.dart';


class ShootingRecordListPage extends StatelessWidget {
  const ShootingRecordListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShootingRecordListCubit>(
      create: (BuildContext context) => ShootingRecordListCubit(
        weaponsRepository: getIt.get(),
      )..onInit(),
      child: const ShootingRecordListWidget(),
    );
  }
}

class ShootingRecordListWidget extends StatefulWidget {
  const ShootingRecordListWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ShootingRecordListState();
}

class _ShootingRecordListState extends State<ShootingRecordListWidget> {
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
    body: BlocBuilder<ShootingRecordListCubit, ShootingRecordListState>(
        builder: (BuildContext context, ShootingRecordListState state) {
          return WeaponList<Success>(
            state: state,
            onRefresh: () => BlocProvider.of<ShootingRecordListCubit>(context).refresh(),
          );
        }),
  );
}