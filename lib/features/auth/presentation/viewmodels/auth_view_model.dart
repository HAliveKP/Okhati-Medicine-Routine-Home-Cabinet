import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repositories/authentication_repository.dart';

class AuthState {
  const AuthState({
    this.name = '',
    this.email = '',
    this.password = '',
    this.accepted = true,
    this.passwordVisible = false,
    this.error = false,
  });
  final String name;
  final String email;
  final String password;
  final bool accepted;
  final bool passwordVisible;
  final bool error;

  AuthState copyWith({
    String? name,
    String? email,
    String? password,
    bool? accepted,
    bool? passwordVisible,
    bool? error,
  }) => AuthState(
    name: name ?? this.name,
    email: email ?? this.email,
    password: password ?? this.password,
    accepted: accepted ?? this.accepted,
    passwordVisible: passwordVisible ?? this.passwordVisible,
    error: error ?? this.error,
  );
}

class AuthViewModel extends StateNotifier<AuthState> {
  AuthViewModel(this._repository) : super(const AuthState());
  final AuthenticationRepository _repository;

  void setName(String value) =>
      state = state.copyWith(name: value, error: false);
  void setEmail(String value) =>
      state = state.copyWith(email: value, error: false);
  void setPassword(String value) =>
      state = state.copyWith(password: value, error: false);
  void setAccepted(bool value) => state = state.copyWith(accepted: value);
  void togglePasswordVisibility() =>
      state = state.copyWith(passwordVisible: !state.passwordVisible);

  Future<bool> signInWithGoogle() async {
    final result = await _repository.signInWithGoogle();
    state = state.copyWith(error: !result);
    return result;
  }

  Future<bool> submit({required bool createAccount}) async {
    final bool validEmail = RegExp(r'^.+@.+\..+$').hasMatch(state.email.trim());
    final bool valid =
        validEmail &&
        state.password.length >= 8 &&
        (!createAccount || (state.name.trim().isNotEmpty && state.accepted));
    if (!valid) {
      state = state.copyWith(error: true);
      return false;
    }
    final bool result = createAccount
        ? await _repository.createAccount(
            name: state.name.trim(),
            email: state.email.trim(),
            password: state.password,
          )
        : await _repository.signIn(
            email: state.email.trim(),
            password: state.password,
          );
    state = state.copyWith(error: !result);
    return result;
  }
}

final authRepositoryProvider = Provider<AuthenticationRepository>(
  (ref) => throw StateError(
    'AuthenticationRepository must be provided by the app composition root.',
  ),
);
final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>(
  (ref) => AuthViewModel(ref.watch(authRepositoryProvider)),
);
