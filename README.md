# Flutter Clean Architecture Project Template: Basic Template

---

## How to Use 🎮

Using this template is easy.

1. Choose template from branch.
2. Press use this template button.
3. Create your repository.
4. Clone your repository.
5. Rename package name from `dev.csejrup.template` to your liking.
6. Rename the project name from `template` to your need.

Freezed Code generator.

This template optimizes freezed generator only to certain suffixes to improve build time.
The available suffixes are:

- `*.codegen.dart`
- `*.model.dart`
- `*.entity.dart`

For blocs, it automaticly read inside `blocs` directory.

Snackbar Flash

You can use snackbar easily with `FlashCubit`. You can call `context.displayFlash(message)` to show a snackbar.

Before running the project, make sure to generate the necessary code for dependency injection. Run this command:

```bash
flutter packages pub run build_runner build
```

This command generates code for `injectable` modules and factories which are part of this project's dependency injection system.


---

## Getting Started 🚀

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

---
## Freezed Package

Our application makes use of the [Freezed](https://pub.dev/packages/freezed) package, a code generator for unions/pattern-matching/copy. This package helps us in creating immutable and copyable classes easily. This simplifies the process of managing states in our Flutter application.

### Why Freezed?

- **Immutability**: Freezed generates immutable classes, this means once an object is created, it cannot be changed. This can be especially useful in reducing bugs related to state management.
- **Union Types/Sealed Classes**: This provides us a way to define a type which could be one of a variety of types, but each with a known and finite list of possibilities.
- **Simplicity**: Freezed allows you to generate code that is clean and easy to use. For example, it eliminates the need to manually implement copyWith methods for our classes.
- **Integration with other packages**: Freezed integrates well with other packages such as `json_serializable` for JSON serialization.

### Code Example

```dart
@freezed
abstract class Union with _$Union {
  const factory Union(int value) = Data;
  const factory Union.loading() = Loading;
  const factory Union.error([String message]) = ErrorDetails;
}
---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
# Run test with coverage
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```
---
## Project Libraries & Plugins 📚

The project is already included some library to speed up the development process.

| Category | Library Name | Link
|--|--|--
| **State management** | `bloc` | <https://pub.dev/packages/bloc> |
| | `flutter_bloc` | <https://pub.dev/packages/flutter_bloc> |
| | `bloc_concurrency` | <https://pub.dev/packages/bloc_concurrency> |
| **Router** | `go_router`  | <https://pub.dev/packages/go_router> |
| **Code Generator** | `build_runner` | <https://pub.dev/packages/build_runner> |
| | `flutter_gen_runner`* | <https://pub.dev/packages/flutter_gen_runner> |
| | `flutter_native_splash` | <https://pub.dev/packages/flutter_native_splash> |
| **Languange Feature** | `dartz` | <https://pub.dev/packages/dartz>|
| | `equatable` | <https://pub.dev/packages/equatable> |
| | `freezed` | <https://pub.dev/packages/freezed> |
| | `freezed_annotation` | <https://pub.dev/packages/freezed_annotation>|
| | `intl` | <https://pub.dev/packages/intl>|
| | `uuid` | <https://pub.dev/packages/uuid> |
| **JSON** | `json_serializable` | <https://pub.dev/packages/json_serializable> |
| | `json_annotation` | <https://pub.dev/packages/json_annotation> |
| **Dependency Injection** | `get_it` | <https://pub.dev/packages/get_it> |
| | `injectable` | <https://pub.dev/packages/injectable> |
| | `injectable_generator` | <https://pub.dev/packages/injectable_generator> |
| **Local Storage** | `shared_preferences` | <https://pub.dev/packages/shared_preferences> |
| **Logging** | `logging` | <https://pub.dev/packages/logging> |
| **Form Validation** | `formz` | <https://pub.dev/packages/formz/versions/0.5.0-dev.1> |
| **Widgets** | `flutter_hooks` | <https://pub.dev/packages/flutter_hooks> |
| | `flutter_screenutil` | <https://pub.dev/packages/flutter_screenutil> |
| | `flutter_svg` | <https://pub.dev/packages/flutter_svg>  |
| | `google_fonts` | <https://pub.dev/packages/google_fonts> |
| **Testing** | `mocktail` | <https://pub.dev/packages/mocktail> |
| | `bloc_test` | <https://pub.dev/packages/bloc_test> |

All the libraries above are compatible with Flutter 3.

Notes: **need to install [flutter_gen](https://pub.dev/packages/flutter_gen)*

---

## Project Structure 🏛 - Modular Approach with Clean Architecture

The project is structured following the principles of Clean Architecture and a modular approach for improved scalability, maintainability, and readability.

```
...
assets
├── fonts                               # Non-Google fonts
├── google_fonts                        # Google fonts offline
├── icons                               # App icons
├── images                              # App images
lib
├── app
|   ├── router
|   |   ├── app_router.dart             # Application Router
|   ├── view
|   |   ├── app.dart                    # MainApp File
|   ├── app.dart
├── core
|   ├── di                              # Dependency Injection Module
|   ├── domain                          # Base Classes for domain layer
|   ├── utils                           # utilities, constants, and extensions
├── shared                              # Shared Entity, Models, Widget, Service, Utils
├── features
|   ├── counter                         # Feature Counter
|   |   ├── data
|   |   |   ├── datasources             # Data source (network, local)
|   |   |   ├── models                  # DTO / Payload Model
|   |   |   ├── repositories            # Implementation of domain Repository
|   |   ├── domain
|   |   |   ├── entities                # Business Domain Entity
|   |   |   ├── repositories            # Interface Repository
|   |   |   ├── usecases                # Business Use Cases
|   |   ├── presentation
|   |   |   ├── blocs                   # Application Logic & State management
|   |   |   ├── pages                   # Application pages
|   |   |   ├── widgets                 # Common Widgets in Feature
├── l10n
│   ├── arb
│   │   ├── app_en.arb                  # English Translation
│   │   └── app_id.arb                  # Indonesian Translation
├── bootstrap.dart                      # Common Main Bootstrap Script
├── main_development.dart               # Env Development main method
├── main_production.dart                # Env Production main method
├── main_staging.dart                   # Env Staging main method
test
├── app                                 # App Test
├── features
|   ├── counter                         # Feature Counter Test
|   |   ├── data
|   |   |   ├── datasources             # Data source (network, local) test
|   |   |   ├── models                  # DTO / Payload Model test
|   |   |   ├── repositories            # Implementation repository test
|   |   ├── domain
|   |   |   ├── entities                # Business Domain Entity test
|   |   |   ├── repositories            # Interface Repository test
|   |   |   ├── usecases                # Business Use Cases test
|   |   ├── presentation
|   |   |   ├── blocs                   # Bloc Test
|   |   |   ├── pages                   # Application pages test
|   |   |   ├── widgets                 # Common Widgets in Feature test
├── helpers                             # Common Test Helpers
...
```

---

## Working with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Use the new string

```dart
import 'package:template/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
		<string>da</string>
	</array>

    ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_da.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

`app_da.arb`

```arb
{
    "@@locale": "da",
    "counterAppBarTitle": "Tæller",
    "@counterAppBarTitle": {
        "description": "Tekst vist i AppBar på Tæller-siden"
    }
}
```

[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli
