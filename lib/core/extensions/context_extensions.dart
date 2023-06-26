/// This file extends the [BuildContext] class with helpful methods
/// to interact with the UI.
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/core/utils/constants.dart';
import 'package:template/shared/flash/presentation/blocs/cubit/flash_cubit.dart';

extension BuildContextX on BuildContext {
  /// Displays a flash message on the UI using the [FlashCubit].
  ///
  /// The [message] parameter is the content of the
  /// flash message to be displayed
  void displayFlash(String message) {
    read<FlashCubit>().displayFlash(message);
  }

  /// Shows a Snackbar on the UI with a given [message]. Optionally,
  /// an [action] callback and corresponding [actionText] can be provided
  /// to display an actionable item on the Snackbar.
  ///
  /// The Snackbar is displayed for a duration of 2 seconds.
  void showSnackbar({
    required String message,
    void Function()? action,
    String? actionText,
  }) {
    rootScaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        // action: action == null && actionText != null
        //     ? null
        //     : SnackBarAction(label: actionText!, onPressed: action!),
      ),
    );
  }

  /// Returns the current theme of the UI.
  ThemeData get theme => Theme.of(this);
}
