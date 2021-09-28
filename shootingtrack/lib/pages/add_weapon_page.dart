import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddWeaponPage extends StatefulWidget {
  const AddWeaponPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AddWeaponPageState();

}

class _AddWeaponPageState extends State<AddWeaponPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(AppLocalizations.of(context)!.addWeaponTitle),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.of(context).pop(),
      )
    ),
    body: Form(
      key: _formKey,
      child:
        
    ),
  );
}