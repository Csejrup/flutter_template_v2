/// This file defines a [ValueObject] class which is used to
/// encapsulate a value in a domain-driven
/// design (DDD) manner.
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:template/core/domain/failures/errors.dart';
import 'package:template/core/domain/failures/value_failure.codegen.dart';

/// An interface enforcing the implementation of an [isValid] method
abstract class IValidatable {
  bool isValid();
}

/// The [ValueObject] is an abstract class representing a value object in DDD.
/// It enforces the implementation of a [value] getter
/// that returns either a [ValueFailure<T>]
/// or a successful value of type [T].
@immutable
abstract class ValueObject<T> implements IValidatable {
  const ValueObject();

  /// An [Either] object holding either a failure of type [ValueFailure<T>]
  /// or a successful value of type [T].
  Either<ValueFailure<T>, T> get value;

  /// Returns the value or throws [UnexpectedValueError] if there is a failure.
  T getOrCrash() => value.fold((l) => throw UnexpectedValueError(l), id);

  /// Returns the value if it exists, otherwise the [dflt] value.
  T getOrElse(T dflt) => value.getOrElse(() => dflt);

  /// Returns either a [ValueFailure<dynamic>] or a [Unit] representing
  /// the absence of a failure.
  Either<ValueFailure<dynamic>, Unit> get failureOrUnit =>
      value.fold(left, (r) => right(unit));

  /// Returns `true` if the [value] is a [Right] value, otherwise `false`.
  @override
  bool isValid() => value.isRight();

  /// Checks if the given [other] object is equal to this one.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ValueObject<T> && other.value == value;
  }

  /// Returns the hash code of the [value].
  @override
  int get hashCode => value.hashCode;

  /// Returns the string representation of the object.
  @override
  String toString() => 'Value($value)';
}
