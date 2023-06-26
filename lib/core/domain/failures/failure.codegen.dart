import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.codegen.freezed.dart';

/// A Freezed union class, [Failure] represents the different
/// types of failures that can occur in the application.
/// By using Freezed, we can utilize pattern matching to handle
/// each type of failure differently.
/// In this case, [Failure] has two types: [LocalFailure] and [ServerFailure].
@freezed
class Failure with _$Failure {
  /// [LocalFailure] represents a failure that occurred locally on the device.
  /// This could be due to a variety of reasons such as a lack of connectivity,
  /// failure in processing data,
  /// or any other issue that's not a result of a problem with the server.
  ///
  /// [message] parameter provides more information
  /// about the local failure that occurred.
  const factory Failure.localFailure({
    required String message,
  }) = LocalFailure;

  /// [ServerFailure] represents a failure that occurred on the server-side.
  /// This could be due to a variety of reasons such as a server error,
  /// unavailability of server,
  /// or any other issue that's specifically
  /// a result of a problem with the server.
  ///
  /// [message] parameter provides more information
  /// about the server failure that occurred.
  const factory Failure.serverFailure({
    required String message,
  }) = ServerFailure;
}
