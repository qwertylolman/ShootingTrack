import 'package:flutter/material.dart';
import 'package:shootingtrack/presentation/common/base_state.dart';
import 'package:shootingtrack/presentation/widgets/error_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StateBuilder<T> extends StatelessWidget {
  const StateBuilder(
      this.state, {
        Key? key,
        required this.data,
        this.loading,
        this.error,
        this.empty,
      }) : super(key: key);

  final BaseState state;
  final Widget Function(T) data;
  final Widget Function(Object)? error;
  final Widget? loading;
  final Widget Function()? empty;

  @override
  Widget build(BuildContext context) {
    if (state is ErrorState) {
      final ErrorState errorState = state as ErrorState;
      return error?.call(errorState.error) ??
          buildErrorWidget(context, errorState.error);
    } else if (state is LoadingState) {
      return loading ?? const Center(child: CircularProgressIndicator());
    } else if (state is EmptyState) {
      return empty?.call() ??
          ErrorScreen(
            title: AppLocalizations.of(context)!.feedEmptyErrorTitle,
            subtitle: AppLocalizations.of(context)!.feedEmptyErrorSubtitle,
          );
    } else {
      return data(state as T);
    }
  }

  Widget buildErrorWidget(
    BuildContext context,
    Object failure) {
    //TODO: check for exception type
    // if (failure is NoInternetFailure) {
    //   return ErrorScreen.noInternet();
    // } else {
      return ErrorScreen(
        title: AppLocalizations.of(context)!.unknownErrorTitle,
        subtitle: AppLocalizations.of(context)!.unknownErrorSubtitle,
      );
    // }
  }
}
