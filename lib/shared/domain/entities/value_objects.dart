import 'package:dartz/dartz.dart';
import 'package:template/core/domain/entities/value_object.dart';
import 'package:template/core/domain/entities/value_validators.dart';
import 'package:template/core/domain/failures/value_failure.codegen.dart';
import 'package:uuid/uuid.dart';

/// A class representing a unique identifier (UUID). It extends [ValueObject]
/// class, which implies that it is an immutable object and equality is based on
///  the object's value rather than identity.
class UniqueId extends ValueObject<String> {
  /// Factory constructor that takes an input string, validates it
  /// using [validateUniqueId] and returns a [UniqueId] object.
  factory UniqueId(String input) {
    return UniqueId._(validateUniqueId(input));
  }

  /// Factory constructor that generates a new unique identifier (UUID v4) and
  /// returns a [UniqueId] object.
  factory UniqueId.generate() {
    return UniqueId._(
      validateUniqueId(
        const Uuid().v4(),
      ),
    );
  }

  /// Private constructor used to create a [UniqueId] object
  /// from a validated [Either] object.
  const UniqueId._(this.value);

  /// Value of the unique identifier.
  /// It is an [Either] object that can hold either a
  /// [ValueFailure] object (in case of validation failure) or a valid value.
  @override
  final Either<ValueFailure<String>, String> value;
}

/// A class representing a string that can be contained in a single line.
/// It extends [ValueObject] class, which implies that it is an immutable
/// object and equality is based on the object's value rather than identity.
class StringSingleLine extends ValueObject<String> {
  /// Factory constructor that takes an input string, validates it using
  /// [validateStringNotEmpty] and [validateSingleLine],
  /// and returns a [StringSingleLine] object.
  factory StringSingleLine(String input) {
    return StringSingleLine._(
      validateStringNotEmpty(input).flatMap(validateSingleLine),
    );
  }

  /// Private constructor used to create a [StringSingleLine] object from a
  /// validated [Either] object.
  const StringSingleLine._(this.value);

  /// Value of the string. It is an [Either] object that can hold either a
  /// [ValueFailure] object (in case of validation failure) or a valid value.
  @override
  final Either<ValueFailure<String>, String> value;
}
