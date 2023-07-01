import 'package:flutter/material.dart';

import '../constantes/cores.dart';
import '../main.dart';
import '../services/auth_service.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username = "";
  String _password = "";

  final authService = AuthService();

  void _singIn() {
    authService.login(_username, _password).then((logged) {
      if (logged == null) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Login invalido'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Bem-vindo!"), backgroundColor: verde),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                height: 300,
                width: 300,
                child: ClipRRect(
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              TextFormField(
                autocorrect: false,
                enableSuggestions: false,
                decoration: const InputDecoration(labelText: 'Login'),
                onChanged: (value) => setState(() {
                  _username = value;
                }),
              ),
              TextFormField(
                  autocorrect: false,
                  enableSuggestions: false,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Senha'),
                  onChanged: (value) => setState(() {
                        _password = value;
                      })),
              Container(
                  margin: EdgeInsets.all(40),
                  child: ElevatedButton(
                      onPressed: _singIn,
                      child: Text("Entrar"),
                      style: TextButton.styleFrom(
                        backgroundColor: verde,
                        padding: EdgeInsets.all(15),
                      ))),
            ],
          ),
        ));
  }
}
