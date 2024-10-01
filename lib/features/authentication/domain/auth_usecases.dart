// auth_usecases.dart
import '../data/auth_repository.dart';

class AuthUseCases {
  final AuthRepository authRepository;

  AuthUseCases(this.authRepository);

  Future<void> login(String email, String password) {
    return authRepository.login(email, password);
  }

  Future<void> signup(String email, String password) {
    return authRepository.signup(email, password);
  }

  Future<void> logout() {
    return authRepository.logout();
  }
}
