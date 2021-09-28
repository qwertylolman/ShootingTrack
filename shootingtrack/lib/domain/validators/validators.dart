import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String? validateStringNotNullNorEmpty(
    BuildContext context,
    String? value,
    {String? description}) {
  if (value == null || value.isEmpty) {
    return description ?? AppLocalizations.of(context)!.localizationEmptyOrNullString;
  }
  return null;
}