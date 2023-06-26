// ignore_for_file: strict_raw_type

import 'package:template/core/domain/failures/value_failure.codegen.dart';

/// [UnexpectedValueError] is a type of [Error] that is thrown when
/// the application encounters
/// a [ValueFailure] in a situation where a failure is not expected,
/// hence the failure is
/// considered unrecoverable.
///
/// This is generally used in scenarios where a previously validated
/// object fails validation
/// at a later stage in the application lifecycle, which typically
/// indicates a serious issue in
/// the logic of the code, hence the 'unrecoverable' nature of the error.
class UnexpectedValueError extends Error {
  /// Constructor takes the [ValueFailure] that caused this error
  UnexpectedValueError(this.valueFailure);

  /// The [ValueFailure] that led to this error being thrown
  final ValueFailure valueFailure;

  @override

  /// Provides a custom description of the [UnexpectedValueError]
  /// that includes the
  /// [ValueFailure] that caused it.
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was: $valueFailure');
  }
}
