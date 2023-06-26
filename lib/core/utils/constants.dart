import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// This Environment class is a utility class that contains
/// constants for different environments in which the app can run.
class Environment {
  const Environment._();

  // The development environment (often local)
  static const String development = 'development';

  // The staging environment (often a replica of production)
  static const String staging = 'staging';

  // The production environment (where your live app runs)
  static const String production = 'production';

  // The testing environment (for running tests)
  static const String test = 'test';
}

/// The ScreenUtilSize class is a utility class that holds the
class ScreenUtilSize {
  const ScreenUtilSize._();

  // The base screen width
  static const double width = 390;

  // The base screen height
  static const double height = 844;
}

/// The global key that is used to access the ScaffoldMessenger state
/// from anywhere within the app.
final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

/// The DateTimeFormat class provides date and time formats
/// that are used throughout the application.
class DateTimeFormat {
  // Format for displaying days of the week
  static DateFormat get dayString => DateFormat('EEEE', 'en_EU');

  // Format for displaying the date with full month
  static DateFormat get monthAbbrWithDate => DateFormat('d MMMM', 'en_EU');

  // Format for displaying time in 24-hour format
  static DateFormat get hourMinutes => DateFormat('HH:mm', 'en_EU');
}

/// MessageType is an enum that represents different types of messages
/// that can be displayed in the application.
enum MessageType {
  info, // Informational messages
  warning, // Warning messages
  success, // Success messages
  danger, // Error or danger messages
}
