import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../providers/customer_provider.dart';

abstract interface class AuthManager {
  Future<void> signIn(String email, String password);

  Future<void> signUp(String name, String email, String password);

  Future<void> signOut();

  bool get isAuthenticated;

  Future<void> loadCredentials();
}

class DefaultAuthManager implements AuthManager {
  static const _authorizationHeader = 'Authorization';
  static const _accessTokenKey = 'customer.accessToken';

  final CustomerProvider _provider;
  final FlutterSecureStorage _secureStorage;
  final Dio _httpClient;

  DefaultAuthManager(this._httpClient, this._provider, this._secureStorage);

  @override
  Future<void> signIn(String email, String password) async {
    final token = await _provider.signIn(email, password);
    await _secureStorage.write(key: _accessTokenKey, value: token.accessToken);
    await loadCredentials();
  }

  @override
  Future<void> signUp(String name, String email, String password) async {
    await _provider.signUp(name, email, password);
    await signIn(email, password);
  }

  @override
  Future<void> signOut() async {
    _setAuthorizationHeader(null);
    await _secureStorage.deleteAll();
  }

  @override
  Future<void> loadCredentials() async {
    final accessToken = await _secureStorage.read(key: _accessTokenKey);
    _setAuthorizationHeader(accessToken != null ? 'Bearer $accessToken' : null);
  }

  @override
  bool get isAuthenticated =>
      _httpClient.options.headers[_authorizationHeader] != null;

  void _setAuthorizationHeader(String? authorization) =>
      _httpClient.options.headers[_authorizationHeader] = authorization;
}
