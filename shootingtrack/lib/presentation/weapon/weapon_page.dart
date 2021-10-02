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
            padding: const EdgeInsets.all(Dimens.baseMargin),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    buildManufacturerWidget(context, state),
                    buildModelWidget(context, state),
                    buildGaugeWidget(context, state),
                    buildNameWidget(context, state),
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

  Widget buildNameWidget(BuildContext context, WeaponState state) {
    _nameEditingController.text = state is Success
        ? state.weapon.name
        : "";

    return TextFormField(
        autofocus: state is Empty,
        maxLength: Common.maxWeaponNameLength,
        validator: (value) => validateStringNotNullNorEmpty(context, value),
        controller: _nameEditingController,
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context)!.weaponNameField,
          suffixIcon: buildClearButton(context, () => _nameEditingController.clear())
        )
    );
  }

  Widget buildManufacturerWidget(BuildContext context, WeaponState state) {
    _manufacturerEditingController.text = state is Success
        ? state.weapon.manufacturer.name
        : "";

    return TypeAheadFormField<Manufacturer?> (
      textFieldConfiguration: TextFieldConfiguration(
        controller: _manufacturerEditingController,
        maxLength: Common.maxWeaponManufacturerLength,
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context)!.weaponManufacturerField,
          suffixIcon: buildClearButton(context, () => _manufacturerEditingController.clear())
        ),
        onChanged: (text) {
          combineNewNameIfPossible();
        },
      ),
      hideOnEmpty: true,
      hideOnError: true,
      hideOnLoading: true,
      validator: (value) => validateStringNotNullNorEmpty(context, value),
      itemBuilder: (context, Manufacturer? suggestion) => ListTile(
        title: Text(suggestion?.name ?? ""),
      ),
      onSuggestionSelected: (Manufacturer? suggestion) {
        _manufacturerEditingController.text = suggestion?.name ?? "";
        combineNewNameIfPossible();
      },
      suggestionsCallback: (query) async {
        return await BlocProvider.of<WeaponCubit>(context).getManufacturers(query);
      },
    );
  }

  Widget buildModelWidget(BuildContext context, WeaponState state) {
    _modelEditingController.text = state is Success
        ? state.weapon.model.name
        : "";

    return TypeAheadFormField<Model?> (
      textFieldConfiguration: TextFieldConfiguration(
        controller: _modelEditingController,
        maxLength: Common.maxWeaponModelLength,
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context)!.weaponModelField,
          suffixIcon: buildClearButton(context, () => _modelEditingController.clear())
        ),
        onChanged: (text) {
          combineNewNameIfPossible();
        },
      ),
      hideOnEmpty: true,
      hideOnError: true,
      hideOnLoading: true,
      validator: (value) => validateStringNotNullNorEmpty(context, value),
      itemBuilder: (context, Model? suggestion) => ListTile(
        title: Text(suggestion?.name ?? ""),
      ),
      onSuggestionSelected: (Model? suggestion) {
        _modelEditingController.text = suggestion?.name ?? "";
        combineNewNameIfPossible();
      },
      suggestionsCallback: (query) async {
        return await BlocProvider.of<WeaponCubit>(context).getModels(query);
      },
    );
  }

  Widget buildGaugeWidget(BuildContext context, WeaponState state) {
    _gaugeEditingController.text = state is Success
        ? state.weapon.gauge.name
        : "";

    return TypeAheadFormField<Gauge?>(
      textFieldConfiguration: TextFieldConfiguration(
        controller: _gaugeEditingController,
        maxLength: Common.maxWeaponGaugeLength,
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context)!.weaponGaugeField,
          suffixIcon: buildClearButton(context, () => _gaugeEditingController.clear())
        ),
        onChanged: (text) {
          combineNewNameIfPossible();
        },
      ),
      hideOnEmpty: true,
      hideOnError: true,
      hideOnLoading: true,
      validator: (value) => validateStringNotNullNorEmpty(context, value),
      itemBuilder: (context, Gauge? suggestion) =>
          ListTile(
            title: Text(suggestion?.name ?? ""),
          ),
      onSuggestionSelected: (Gauge? suggestion) {
        _gaugeEditingController.text = suggestion?.name ?? "";
        combineNewNameIfPossible();
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

  void combineNewNameIfPossible() {
    var name = _nameEditingController.text.trim();
    var manufacturer = _manufacturerEditingController.text;
    var model = _modelEditingController.text;
    var gauge = _gaugeEditingController.text;

    if (manufacturer.isNotEmpty) {
      manufacturer = "$manufacturer ";
    }

    if (model.isNotEmpty) {
      model = "$model ";
    }

    var proposedName = "$manufacturer$model$gauge".trim();
    if (name.isEmpty
        || proposedName.startsWith(name)
        || name.startsWith(proposedName)) {
      _nameEditingController.text = proposedName;
    }
  }
}