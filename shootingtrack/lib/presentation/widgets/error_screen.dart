import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  factory ErrorScreen.noInternet(BuildContext context) => ErrorScreen(
    title: AppLocalizations.of(context)!.noInternetTitle,
    subtitle: AppLocalizations.of(context)!.noInternetSubtitle,
  );

  factory ErrorScreen.empty(BuildContext context) => ErrorScreen(
    title: AppLocalizations.of(context)!.feedEmptyErrorTitle,
    subtitle: AppLocalizations.of(context)!.feedEmptyErrorSubtitle,
  );

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1,
        )
      ],
    );
  }
}
