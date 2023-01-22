import 'package:flutter/material.dart';
import 'package:flutter_bloc_login/src/base/base_bloc_page.dart';
import 'package:flutter_bloc_login/src/feature/auth/login/login_bloc.dart';
import 'package:flutter_bloc_login/src/feature/auth/login/login_event.dart';
import 'package:flutter_bloc_login/src/feature/auth/login/login_state.dart';
import 'package:flutter_bloc_login/src/feature/home/home_page.dart';

class LoginPage extends BaseBlocPage<LoginBloc, LoginEvent, LoginState> {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget contents(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: _loginForm(),
    );
  }

  Widget _loginForm() {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _emailField(),
          const SizedBox(height: 10.0),
          _passwordField(),
          const SizedBox(height: 20.0),
          _loginButton()
        ],
      ),
    );
  }

  Widget _emailField() {
    return builder(
      (context, state) => TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.email),
          border: const OutlineInputBorder(),
          labelText: "Email",
          hintText: "Enter your email",
          errorText: state.getEmailError(),
        ),
        onChanged: (value) => bloc.add(EmailChanged(email: value)),
      ),
    );
  }

  Widget _passwordField() {
    return builder(
      (context, state) => TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          border: const OutlineInputBorder(),
          labelText: "Password",
          hintText: "Enter your password",
          errorText: state.getPasswordError(),
        ),
        obscureText: true,
        onChanged: (value) => bloc.add(PasswordChanged(password: value)),
      ),
    );
  }

  Widget _loginButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
      onPressed: (() => navigate(const HomePage())),
      child: const Center(
        widthFactor: 3,
        heightFactor: 3,
        child: Text("Login"),
      ),
    );
  }
}
