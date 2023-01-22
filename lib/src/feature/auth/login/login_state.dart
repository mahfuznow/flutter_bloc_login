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

  String? getEmailError() {
    if (email.isEmpty) return "Please enter your email";
    if (email.length < 5) return "Email is too short";
    return null;
  }

  String? getPasswordError() {
    if (password.isEmpty) return "Please enter your password";
    if (password.length < 5) return "Password is too short";
    return null;
  }
}
