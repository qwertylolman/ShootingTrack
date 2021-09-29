import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:shootingtrack/common.dart';
import 'package:shootingtrack/data/data.dart';
import 'package:shootingtrack/data/entities/weapon.dart';
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
        weaponsRepository: getIt.get(),
          gaugesRepository: getIt.get(),
          modelsRepository: getIt.get(),
          manufacturersRepository: getIt.get())
        ..onInit(weaponId),
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

  final _nameEditingController = TextEditingController();
  final _manufacturerEditingController = TextEditingController();
  final _modelEditingController = TextEditingController();
  final _gaugeEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) =>
    BlocBuilder<WeaponCubit, WeaponState>(
      builder: (BuildContext context, WeaponState state) =>
        Scaffold(
          appBar: AppBar(
            title: Text(state is EmptyState
              ? AppLocalizations.of(context)!.addWeaponTitle
              : AppLocalizations.of(context)!.editWeaponTitle),
            leading: buildCloseButton(context, cancelChanges),
            actions: buildAppBarMenuIcons(context, state),
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
                    autofocus: state is Empty,
                    initialValue: state is Success
                      ? state.weapon.name
                      : '',
                    maxLength: Common.maxWeaponNameLength,
                    validator: (value) => validateStringNotNullNorEmpty(context, value),
                    controller: _nameEditingController,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.weaponNameField,
                    )
                  ),
                  buildManufacturersAutocomplete(context),
                  buildModelAutocomplete(context),
                  buildGaugeAutocomplete(context),
                ],
              )
            ),
            )
          )
        )
    );

  @override
  void dispose() {
    _nameEditingController.dispose();
    _manufacturerEditingController.dispose();
    _modelEditingController.dispose();
    _gaugeEditingController.dispose();

    super.dispose();
  }

  List<Widget> buildAppBarMenuIcons(BuildContext context, WeaponState state) {
    if (state is Success) {
      return <Widget>[
        buildDeleteButton(context, () { deleteWeapon(state.weapon); }),
        buildSaveButton(context, () { saveChanges(state.weapon); }),
      ];
    }

    if (state is Empty) {
      return <Widget>[
        buildSaveButton(context, () { saveChanges(null); }),
      ];
    }

    return <Widget>[];
  }

  Widget buildManufacturersAutocomplete(BuildContext context) {
    return TypeAheadFormField<Manufacturer?> (
      textFieldConfiguration: TextFieldConfiguration(
        controller: _manufacturerEditingController,
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context)!.weaponManufacturerField,
        ),
      ),
      validator: (value) => validateStringNotNullNorEmpty(context, value),
      itemBuilder: (context, Manufacturer? suggestion) => ListTile(
        title: Text(suggestion?.name ?? ""),
      ),
      onSuggestionSelected: (Manufacturer? suggestion) {
        _manufacturerEditingController.text = suggestion?.name ?? "";
        onSuggestionSelectedCombineName();
      },
      suggestionsCallback: (query) async {
        return await BlocProvider.of<WeaponCubit>(context).getManufacturers(query);
      },
    );
  }

  Widget buildModelAutocomplete(BuildContext context) {
    return TypeAheadFormField<Model?> (
      textFieldConfiguration: TextFieldConfiguration(
        controller: _modelEditingController,
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context)!.weaponModelField,
        ),
      ),
      validator: (value) => validateStringNotNullNorEmpty(context, value),
      itemBuilder: (context, Model? suggestion) => ListTile(
        title: Text(suggestion?.name ?? ""),
      ),
      onSuggestionSelected: (Model? suggestion) {
        _modelEditingController.text = suggestion?.name ?? "";
        onSuggestionSelectedCombineName();
      },
      suggestionsCallback: (query) async {
        return await BlocProvider.of<WeaponCubit>(context).getModels(query);
      },
    );
  }

  Widget buildGaugeAutocomplete(BuildContext context) {
    return TypeAheadFormField<Gauge?>(
      textFieldConfiguration: TextFieldConfiguration(
        controller: _gaugeEditingController,
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context)!.weaponGaugeField,
        ),
      ),
      validator: (value) => validateStringNotNullNorEmpty(context, value),
      itemBuilder: (context, Gauge? suggestion) =>
          ListTile(
            title: Text(suggestion?.name ?? ""),
          ),
      onSuggestionSelected: (Gauge? suggestion) {
        _gaugeEditingController.text = suggestion?.name ?? "";
        onSuggestionSelectedCombineName();
      },
      suggestionsCallback: (query) async {
        return await BlocProvider.of<WeaponCubit>(context).getGauges(query);
      },
    );
  }

  void cancelChanges() {
    Navigator.of(context).pop();
  }

  void saveChanges(Weapon? weapon) {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (weapon == null) {
      BlocProvider.of<WeaponCubit>(context).createWeapon(
          _nameEditingController.text,
          _manufacturerEditingController.text,
          _modelEditingController.text,
          _gaugeEditingController.text);
    } else {
      BlocProvider.of<WeaponCubit>(context).updateWeapon(
          weapon.id,
          _nameEditingController.text,
          _manufacturerEditingController.text,
          _modelEditingController.text,
          _gaugeEditingController.text);
    }

    Navigator.of(context).pop();
  }

  void deleteWeapon(Weapon weapon) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(AppLocalizations.of(context)!.areYouSure),
            content: Text(AppLocalizations.of(context)!.destructiveActionDescription),
            actions: <Widget> [
              TextButton(
                child: Text(AppLocalizations.of(context)!.confirm),
                onPressed: () { deleteWeaponConfirmed(weapon); },
              ),
              TextButton(
                child: Text(AppLocalizations.of(context)!.cancel),
                onPressed: () { Navigator.of(context).pop(); },
              ),
            ],
          );
        });
  }

  void deleteWeaponConfirmed(Weapon weapon) {
    Navigator.of(context).pop();
  }

  void onSuggestionSelectedCombineName() {
    var name = _nameEditingController.text;
    if (name.isNotEmpty) {
      return;
    }

    var manufacturer = _manufacturerEditingController.text;
    var model = _modelEditingController.text;
    var gauge = _gaugeEditingController.text;

    if (manufacturer.isNotEmpty) {
      manufacturer = "$manufacturer ";
    }

    if (model.isNotEmpty) {
      model = "$model ";
    }

    _nameEditingController.text = "$manufacturer$model$gauge";
  }
}