import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:template/core/domain/failures/failure.codegen.dart';

/// [UseCase] is an abstract class that represents a business operation.
/// It encapsulates all the business logic of a particular use case.
/// [ReturnValue] is the type of the return value of the use case.
/// [Params] is the type of the parameters passed to the use case. It extends
/// from Equatable to make it easy to compare instances.
/// It contains a single method [call()] which will be implemented by all use
/// cases that extend this class.
abstract class UseCase<ReturnValue, Params extends Equatable> {
  const UseCase();
  Future<Either<Failure, ReturnValue>> call(Params params);
}

/// [StreamUseCase] is an abstract class for
/// business operations that return a stream.
/// Similar to [UseCase], it has [ReturnValue] and [Params] types,
/// but instead of returning a Future, it returns a Stream.
abstract class StreamUseCase<ReturnValue, Params extends Equatable> {
  const StreamUseCase();
  Stream<Either<Failure, ReturnValue>> call(Params params);
}

/// [NoParams] is a helper class for use cases that do not need any parameters.
/// An instance of this class can be passed when calling a use case
/// that does not require any parameters.
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
