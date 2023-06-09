import 'package:flutter/material.dart';
import '/screens/home.dart';
import '/themes/branding.dart';

class Signup extends StatefulWidget {
  ThemeData? theme;
  List<Widget>? actions;
  Signup({Key? key, this.theme, this.actions}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SignupState();
  }
}

class _SignupState extends State<Signup> {
  ThemeData? _theme;
  List<Widget>? _actions;
  TextEditingController _ctrlUsername = TextEditingController();
  TextEditingController _ctrlEmail = TextEditingController();
  TextEditingController _ctrlPassword = TextEditingController();
  TextEditingController _ctrlFirstname = TextEditingController();
  TextEditingController _ctrlMiddlename = TextEditingController();
  TextEditingController _ctrlLastname = TextEditingController();
  TextEditingController _ctrlMobilephone = TextEditingController();
  _SignupState();

  @override
  void initState() {
    super.initState();
    _theme = super.widget.theme ?? themeDark;
    _actions = [Home()];
  }

  @override
  void dispose() {
    _ctrlUsername.dispose();
    _ctrlEmail.dispose();
    _ctrlPassword.dispose();
    super.dispose();
  }

  void _login() {
    String username = _ctrlUsername.text;
    String email = _ctrlEmail.text;
    String password = _ctrlPassword.text;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("$username\n$email\n$password"),
    ));
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
            key: const Key("Signup-form"),
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
                    margin: const EdgeInsetsDirectional.only(top: 5),
                    color: const Color(0x77000000),
                    child: TextField(
                      key: const Key("Firstname"),
                      controller: _ctrlFirstname,
                      decoration: const InputDecoration(
                          fillColor: Colors.white54,
                          hoverColor: Color(colorHighlightDark),
                          label: Text("Firstname"),
                          hintText: "Jane"),
                    )),
                Container(
                    margin: const EdgeInsetsDirectional.only(top: 5),
                    color: const Color(0x77000000),
                    child: TextField(
                      key: const Key("Middlename"),
                      controller: _ctrlMiddlename,
                      decoration: const InputDecoration(
                          fillColor: Colors.white54,
                          hoverColor: Color(colorHighlightDark),
                          label: Text("Middlename"),
                          hintText: "Doe"),
                    )),
                Container(
                    margin: const EdgeInsetsDirectional.only(top: 5),
                    color: const Color(0x77000000),
                    child: TextField(
                      key: const Key("Lastname"),
                      controller: _ctrlLastname,
                      decoration: const InputDecoration(
                          fillColor: Colors.white54,
                          hoverColor: Color(colorHighlightDark),
                          label: Text("Lastname"),
                          hintText: "Qew"),
                    )),
                Container(
                    margin: const EdgeInsetsDirectional.only(top: 5),
                    color: const Color(0x77000000),
                    child: TextField(
                      key: const Key("Mobilephone"),
                      controller: _ctrlMobilephone,
                      decoration: const InputDecoration(
                          fillColor: Colors.white54,
                          hoverColor: Color(colorHighlightDark),
                          label: Text("Mobile phone"),
                          hintText: "0123456789"),
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                        onPressed: _login,
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
                        onPressed: _login,
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                              color: _theme!.colorScheme.onPrimary,
                              fontWeight: FontWeight.bold),
                        ))),
                Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: TextButton(
                        onPressed: _login,
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
