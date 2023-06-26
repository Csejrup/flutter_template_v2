import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failure.codegen.freezed.dart';

/// [ValueFailure] represents a failure that occurs when a value fails to
/// meet certain criteria.
/// The [ValueFailure] class uses the `freezed` package to
/// define a union type with different possible types of failure,
/// each carrying information about the failure.
/// Each type of failure includes a `failedValue` property that provides more
/// information about the failure.
@freezed
class ValueFailure<T> with _$ValueFailure<T> {
  /// [ValueFailureEmpty] represents a failure that occurred when a value is
  /// empty but should not be.
  /// The `failedValue` property contains the value that failed this validation.
  const factory ValueFailure.empty({required T failedValue}) =
      ValueFailureEmpty<T>;

  /// [ValueFailureMultiLine] represents a failure that occurred when a value
  /// contains multiple lines but should not.
  /// The `failedValue` property contains the value that failed this validation.
  const factory ValueFailure.multiLine({required T failedValue}) =
      ValueFailureMultiLine<T>;

  /// [ValueNotInRange] represents a failure that occurred when a numerical
  /// value is not within the provided range (minimum to maximum).
  /// The `failedValue` property contains the numerical value
  /// that failed this validation.
  /// `minimum` and `maximum` properties represent the expected range.
  const factory ValueFailure.notInRange({
    required T failedValue,
    required T minimum,
    required T maximum,
  }) = ValueNotInRange<T>;

  /// [ValueInvalidUniqueId] represents a failure that occurred
  /// when a unique ID is not valid.
  /// The `failedValue` property contains the unique ID that
  /// failed this validation.
  const factory ValueFailure.invalidUniqueId({
    required T failedValue,
  }) = ValueInvalidUniqueId<T>;
}
