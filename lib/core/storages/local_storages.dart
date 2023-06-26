import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// An abstract class that declares methods to store and retrieve
/// API keys using local storage.
abstract class LocalStorage {
  Future<String?> getApiKey();
  Future<void> setApiKey(String apiKey);
}

/// The implementation of the [LocalStorage] interface
/// using Shared Preferences for local storage.
/// This class is a singleton, meaning that only one instance of it
/// will exist in the application.
/// This instance is lazily initialized, meaning that it will not be created
/// until it is needed.
/// This class is bound to the [LocalStorage] interface, so when you ask for
/// an instance of [LocalStorage] you will get an instance of [LocalStorageImpl]
@LazySingleton(as: LocalStorage)
class LocalStorageImpl implements LocalStorage {
  /// The constructor takes an instance of [SharedPreferences],
  /// which is used for storing and retrieving data.
  const LocalStorageImpl(this._storage);

  final SharedPreferences _storage;
  static const _apiKeyKey = 'apiKey';

  /// Retrieves the API key from shared preferences, if it exists.
  /// Returns null otherwise.
  @override
  Future<String?> getApiKey() {
    return Future.value(
      _storage.getString(_apiKeyKey),
    );
  }

  /// Stores the API key in shared preferences.
  @override
  Future<void> setApiKey(String apiKey) async {
    await Future.value(
      _storage.setString(_apiKeyKey, apiKey),
    );
  }
}
