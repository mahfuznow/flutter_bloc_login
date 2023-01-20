class LoginState {
  final String email;
  final String password;

  LoginState({
    this.email = "",
    this.password = "",
  });

  LoginState copyWith({
    String? email,
    String? password,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  bool get isValidEmail => email.length > 5;
  bool get isValidPassword => password.length >= 8;
}
