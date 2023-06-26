import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:template/injector.config.dart';

// An instance of GetIt is created to provide service location.
final getIt = GetIt.instance;

/// This function is responsible for configuring dependencies of the application
/// It uses the @InjectableInit annotation from the 'injectable' package to
/// generate the code needed for dependency injection.
/// The `generateForDir` parameter specifies the directories that should be
/// included in the code generation process.
/// This function should be called at the start of your application (typically
/// in the main function), providing the appropriate [environment].
/// This allows you to switch between different implementations of a service
/// based on the environment (i.e., development, staging, production, etc.).
@InjectableInit(generateForDir: ['lib', 'test'])
Future<void> configureDependencies({required String environment}) async =>
    getIt.init(environment: environment);
