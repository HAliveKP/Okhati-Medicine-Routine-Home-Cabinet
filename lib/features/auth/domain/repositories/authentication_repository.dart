abstract interface class AuthenticationRepository {
  Future<bool> signIn({required String email, required String password});
  Future<bool> createAccount({
    required String name,
    required String email,
    required String password,
  });
  Future<bool> signInWithGoogle();
}
