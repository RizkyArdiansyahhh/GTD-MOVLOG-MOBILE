import '../../domain/repositories/auth_repository.dart';

/// Mock implementation of [AuthRepository] for testing UI/UX states.
class MockAuthRepository implements AuthRepository {
  @override
  Future<bool> login(String username, String password) async {
    // Simulate network delay for UX testing
    await Future.delayed(const Duration(milliseconds: 600));

    // Simple validation rule for UI/UX testing:
    // Reject if password is 'invalid' or 'error'
    if (password == 'invalid' || password == 'error') {
      return false;
    }

    return true;
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 300));
  }
}
