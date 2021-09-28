import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shootingtrack/common.dart';
import 'package:shootingtrack/di/di.dart';
import 'package:shootingtrack/dimens.dart';
import 'package:shootingtrack/domain/validators/validators.dart';
import 'package:shootingtrack/presentation/common/base_state.dart';
import 'package:shootingtrack/presentation/common/button_widgets.dart';
import 'package:shootingtrack/presentation/weapon/bloc/weapon_cubit.dart';
import 'package:shootingtrack/presentation/weapon/bloc/weapon_state.dart';

class WeaponPage extends StatelessWidget {
  const WeaponPage({Key? key, this.weaponId}) : super(key: key);

  final String? weaponId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeaponCubit>(
      create: (BuildContext context) => WeaponCubit(
        weaponsRepository: getIt.get())..onInit(weaponId),
      child: const WeaponPageWidget(),
    );
  }

}

class WeaponPageWidget extends StatefulWidget {
  const WeaponPageWidget({Key? key}) : super(key: key);

  @override
  _WeaponPageState createState() => _WeaponPageState();
}

class _WeaponPageState extends State<WeaponPageWidget> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<WeaponCubit, WeaponState>(
        builder: (BuildContext context, WeaponState state) =>
          Scaffold(
            appBar: AppBar(
              title: Text(state is EmptyState
                  ? AppLocalizations.of(context)!.addWeaponTitle
                  : AppLocalizations.of(context)!.editWeaponTitle),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: cancelChanges,
              ),
              actions: [
                buildSaveButton(context, saveChanges),
              ],
            ),
            body: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimens.baseMargin,
                    vertical: Dimens.baseMargin),
                child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                          initialValue: state is Success
                              ? state.weapon.name
                              : '',
                          maxLength: Common.maxWeaponNameLength,
                          validator: (value) => validateStringNotNullNorEmpty(context, value),
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!.weaponNameField,
                          )
                      )
                    ],
                  )
                ),
              )
            )
          )
      );

  void cancelChanges() {
    Navigator.of(context).pop();
  }

  void saveChanges() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    Navigator.of(context).pop();
  }
}