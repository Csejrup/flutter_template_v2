import 'package:flutter/material.dart';
import 'package:template/core/domain/failures/failure.codegen.dart';
import 'package:template/core/extensions/context_extensions.dart';

/// [FailureMessageHandler] is a mixin used to
/// handle displaying of failure messages.
/// It uses the `handleFailure` function to
/// check the type of failure (`LocalFailure` or `ServerFailure`)
/// and then uses the extension method `displayFlash`
/// on [BuildContext] to display the failure message.
mixin FailureMessageHandler {
  /// The [handleFailure] method takes in a [BuildContext]
  /// and a [Failure] object.
  /// It uses the `when` method on the [Failure] object to check
  /// whether it's a `localFailure` or a `serverFailure`,
  /// and then calls the `displayFlash` method on [BuildContext]
  /// to display an appropriate message.
  void handleFailure(BuildContext context, Failure failure) {
    failure.when(
      localFailure: (message) => context.displayFlash(message),
      serverFailure: (message) => context.displayFlash(message),
    );
  }
}
