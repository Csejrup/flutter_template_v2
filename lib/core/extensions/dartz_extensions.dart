/// This file extends the [Either] class from dartz package
/// with helpful methods to retrieve
/// Left and Right values.
import 'package:dartz/dartz.dart';

extension EitherX<L, R> on Either<L, R> {
  /// Returns the Right value if it exists, otherwise null.
  ///
  /// An Either<L, R> object can hold a value of either type L
  /// (Left) or type R (Right).
  /// This method allows you to directly get the Right value.
  R? getRight() => fold<R?>((_) => null, (r) => r);

  /// Returns the Left value if it exists, otherwise null.
  ///
  /// An Either<L, R> object can hold a value of either
  /// type L (Left) or type R (Right).
  /// This method allows you to directly get the Left value.
  L? getLeft() => fold<L?>((l) => l, (_) => null);

  /// Transforms the Either value to an Option, then transforms
  /// that Option to a nullable type.
  /// Returns the Right value if it exists, otherwise null.
  R? unwrapRight() {
    return toOption().toNullable();
  }

  ///
  /// Example...
  /// Future<Either<Failure, User>> getUser() {
  /// 	implementation...
  /// }
}
