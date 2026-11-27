import '../domain/repositories/authentication_repository.dart';

class MockAuthenticationRepository implements AuthenticationRepository {
  @override
  Future<bool> signIn({
    required String email,
    required String password,
  }) async => true;

  @override
  Future<bool> createAccount({
    required String name,
    required String email,
    required String password,
  }) async => true;
}
