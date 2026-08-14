/// Abstract contract for Authentication repository.
abstract class AuthRepository {
  /// Simulates login request. Returns true if credentials are accepted.
  Future<bool> login(String username, String password);

  /// Simulates logout request.
  Future<void> logout();
}
