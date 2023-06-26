/// This file defines a series of value validation functions
/// that are used across the application.
/// These functions use Either to return either a
/// failure or a successful result. Failures are represented
/// by [ValueFailure] objects, while successful results
/// contain the validated value.

import 'package:dartz/dartz.dart';
import 'package:template/core/domain/failures/value_failure.codegen.dart';

/// Validates that the provided [input] string is not empty.
/// Returns either a [ValueFailure.empty] if the input is empty,
/// or the input string itself if it's not.
Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  if (input.isEmpty) {
    return left(ValueFailure.empty(failedValue: input));
  } else {
    return right(input);
  }
}

/// Validates that the provided [input] string does not
/// contain newline characters.
/// Returns either a [ValueFailure.multiLine] if the input
/// contains newline characters,
/// or the input string itself if it doesn't.
Either<ValueFailure<String>, String> validateSingleLine(String input) {
  if (input.contains('\n')) {
    return left(ValueFailure.multiLine(failedValue: input));
  } else {
    return right(input);
  }
}

/// Validates that a provided number of type [T] (where [T] extends [num])
/// is within a specific range.
/// Returns either a [ValueFailure.notInRange] if the number is
/// outside the range,
/// or the number itself if it's within the range.
Either<ValueFailure<T>, T> validateNumberRange<T extends num>({
  required T minimum,
  required T maximum,
  required T number,
}) {
  if (number > maximum || number < minimum) {
    return left(
      ValueFailure.notInRange(
        failedValue: number,
        minimum: minimum,
        maximum: maximum,
      ),
    );
  } else {
    return right(number);
  }
}

/// Validates that the provided [input]
/// string is a valid UUID (Universally Unique Identifier).
/// Returns either a [ValueFailure.invalidUniqueId]
/// if the input is not a valid UUID,
/// or the input string itself if it's a valid UUID.
Either<ValueFailure<String>, String> validateUniqueId(String input) {
  final regex = RegExp(
    '^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}',
  );
  if (regex.hasMatch(input)) {
    return right(input);
  }
  return left(ValueFailure.invalidUniqueId(failedValue: input));
}
