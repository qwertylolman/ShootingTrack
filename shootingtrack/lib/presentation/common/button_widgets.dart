import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

IconButton buildSaveButton(BuildContext context, VoidCallback onPressed) =>
    IconButton(
        tooltip: AppLocalizations.of(context)!.save,
        icon: const Icon(Icons.check),
        onPressed: onPressed,
    );

IconButton buildCancelButton(BuildContext context, VoidCallback onPressed) =>
    IconButton(
      tooltip: AppLocalizations.of(context)!.cancel,
      icon: const Icon(Icons.close),
      onPressed: onPressed,
    );