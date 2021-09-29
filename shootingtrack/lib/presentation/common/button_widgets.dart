import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

IconButton buildClearButton(BuildContext context, VoidCallback onPressed) =>
    IconButton(
      tooltip: AppLocalizations.of(context)!.clear,
      icon: const Icon(Icons.clear),
      onPressed: onPressed,
    );

IconButton buildBackButton(BuildContext context, VoidCallback onPressed) =>
  IconButton(
    tooltip: AppLocalizations.of(context)!.back,
    icon: const Icon(Icons.arrow_back),
    onPressed: onPressed,
  );

IconButton buildCloseButton(BuildContext context, VoidCallback onPressed) =>
  IconButton(
    tooltip: AppLocalizations.of(context)!.close,
    icon: const Icon(Icons.close),
    onPressed: onPressed,
  );

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

IconButton buildDeleteButton(BuildContext context, VoidCallback onPressed) =>
  IconButton(
    tooltip: AppLocalizations.of(context)!.delete,
    icon: const Icon(Icons.delete_forever),
    onPressed: onPressed,
  );