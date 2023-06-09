import 'dart:io';

import 'package:flutter/material.dart';
import '/forms/signup.dart';
import '/session_manager.dart';

import '../screens/home.dart';
import '../themes/branding.dart';

class Login extends StatefulWidget {
  ThemeData? theme;
  Function? onLogin;
  Login({Key? key, this.theme, this.onLogin}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  ThemeData? _theme;
  Function? _onLogin;
  TextEditingController _ctrlUsername = TextEditingController();
  TextEditingController _ctrlEmail = TextEditingController();
  TextEditingController _ctrlPassword = TextEditingController();
  _LoginState();
  @override
  void initState() {
    super.initState();
    _theme = super.widget.theme ?? themeDark;
    _onLogin = super.widget.onLogin;
  }

  @override
  void dispose() {
    _ctrlUsername.dispose();
    _ctrlEmail.dispose();
    _ctrlPassword.dispose();
    super.dispose();
  }

  void onLogin(BuildContext context) async {
    String username = _ctrlUsername.text;
    String email = _ctrlEmail.text;
    String password = _ctrlPassword.text;
    SessionManager().login(username, email, password);
    if (_onLogin != null) {
      bool isValid = await SessionManager().validateSession();
      if (!isValid) {
        _onLogin!(
            context,
            Home(
              title: "Welcome, $username!",
            ));
        dispose();
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid credentials")));
      }
    }
  }

  void _onSignup() {
    Scaffold(
      body: Signup(),
    );
  }

  @override
  Widget build(BuildContext context) {
    var contTitle = Container(
      margin: const EdgeInsets.only(top: 30),
      child: Text(
        "Log in",
        style: TextStyle(
            color: _theme!.colorScheme.primary,
            fontSize: 50,
            fontWeight: FontWeight.bold),
      ),
    );
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 100),
      height: 600,
      child: Center(
          child: Container(
        width: 600,
        padding: const EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(colorSecondaryLightBrand)),
        child: Form(
            key: const Key("Login-form"),
            child: Column(
              children: [
                contTitle,
                Container(
                    margin: const EdgeInsetsDirectional.only(top: 20),
                    color: const Color(0x77000000),
                    child: TextField(
                      key: const Key("Username"),
                      controller: _ctrlUsername,
                      decoration: const InputDecoration(
                          fillColor: Colors.white54,
                          hoverColor: Color(colorHighlightDark),
                          label: Text("Username"),
                          hintText: "jane.doe"),
                    )),
                Container(
                    margin: const EdgeInsetsDirectional.only(top: 5),
                    color: const Color(0x77000000),
                    child: TextField(
                      key: const Key("Email"),
                      controller: _ctrlEmail,
                      decoration: const InputDecoration(
                          fillColor: Colors.white54,
                          hoverColor: Color(colorHighlightDark),
                          label: Text("Email"),
                          hintText: "jane.doe@sample.com"),
                    )),
                Container(
                    margin: const EdgeInsetsDirectional.only(top: 5),
                    color: const Color(0x77000000),
                    child: TextField(
                      key: const Key("Password"),
                      controller: _ctrlPassword,
                      obscureText: true,
                      decoration: const InputDecoration(
                          fillColor: Colors.white54,
                          hoverColor: Color(colorHighlightDark),
                          label: Text("Password"),
                          hintText: "Password"),
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                        onPressed: () {
                          onLogin(context);
                        },
                        child: Text(
                          "Log in",
                          style: TextStyle(
                              color: _theme!.colorScheme.onPrimary,
                              fontWeight: FontWeight.bold),
                        ))),
                Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                _theme!.highlightColor)),
                        onPressed: _onSignup,
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                              color: _theme!.colorScheme.onPrimary,
                              fontWeight: FontWeight.bold),
                        ))),
                Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: TextButton(
                        onPressed: () {
                          onLogin(context);
                        },
                        child: Text(
                          "Forgot password",
                          style: TextStyle(
                              color: _theme!.colorScheme.primary,
                              fontWeight: FontWeight.bold),
                        )))
              ],
            )),
      )),
    );
  }
}
