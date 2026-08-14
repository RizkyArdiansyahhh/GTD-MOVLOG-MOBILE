import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/mock_auth_repository.dart';
import '../../domain/repositories/auth_repository.dart';

/// Provider for [AuthRepository] interface.
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return MockAuthRepository();
});

/// StateNotifier for Login Screen UI state.
class LoginNotifier extends StateNotifier<AsyncValue<bool?>> {
  LoginNotifier(this._authRepository) : super(const AsyncData(null));

  final AuthRepository _authRepository;

  /// Resets state back to idle / AsyncData(null)
  void reset() {
    state = const AsyncData(null);
  }

  /// Triggers login presentation flow
  Future<void> login(String username, String password) async {
    state = const AsyncLoading();
    try {
      final success = await _authRepository.login(username, password);
      if (success) {
        state = const AsyncData(true);
      } else {
        state = AsyncError(
          'Invalid username or password. Please try again.',
          StackTrace.current,
        );
      }
    } catch (e, st) {
      state = AsyncError('An unexpected error occurred.', st);
    }
  }
}

/// Provider for [LoginNotifier]
final loginNotifierProvider =
    StateNotifierProvider<LoginNotifier, AsyncValue<bool?>>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LoginNotifier(repository);
});
