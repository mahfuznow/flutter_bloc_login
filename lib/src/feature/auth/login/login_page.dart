import 'package:flutter/material.dart';
import 'package:flutter_bloc_login/src/feature/home/home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  late final BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
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
    return const TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(),
        labelText: "Email",
        hintText: "Enter your email",
      ),
    );
  }

  Widget _passwordField() {
    return const TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(),
        labelText: "Password",
        hintText: "Enter your password",
      ),
      obscureText: true,
    );
  }

  Widget _loginButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
      onPressed: (() {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: ((context) => const HomePage())));
      }),
      child: const Center(
        widthFactor: 3,
        heightFactor: 3,
        child: Text("Login"),
      ),
    );
  }
}
