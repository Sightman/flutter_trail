import 'package:flutter/material.dart';
import 'package:flutter_trail/forms/login.dart';
import 'package:flutter_trail/screens/welcome.dart';
import '../screens/consumer_home.dart';
import '/themes/branding.dart';

class Signup extends StatefulWidget {
  ThemeData? theme;
  Function? onLogin;
  Function? onSignup;
  Function? onLinkScreen;
  Function? onLinkBack;
  Function? onLinkExternal;
  Signup(
      {Key? key,
      this.theme,
      this.onLogin,
      this.onSignup,
      this.onLinkScreen,
      this.onLinkExternal})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SignupState();
  }
}

class _SignupState extends State<Signup> {
  String _selectedRole = "";
  List<String> _roles = [];
  ThemeData? _theme;
  List<Widget>? _actions;
  TextEditingController _ctrlUsername = TextEditingController();
  TextEditingController _ctrlEmail = TextEditingController();
  TextEditingController _ctrlPassword = TextEditingController();
  TextEditingController _ctrlMobile = TextEditingController();
  TextEditingController _ctrlFirstname = TextEditingController();
  TextEditingController _ctrlMiddlename = TextEditingController();
  TextEditingController _ctrlLastname = TextEditingController();
  _SignupState();

  @override
  void initState() {
    super.initState();
    _theme = super.widget.theme ?? themeDark;
    _actions = [ConsumerHomeScreen()];
    _roles = ["Client", "Partner"];
  }

  @override
  void dispose() {
    _ctrlUsername.dispose();
    _ctrlEmail.dispose();
    _ctrlPassword.dispose();
    _ctrlMobile.dispose();
    _ctrlFirstname.dispose();
    _ctrlMiddlename.dispose();
    _ctrlLastname.dispose();
    super.dispose();
  }

  void _login() {
    String username = _ctrlUsername.text;
    String email = _ctrlEmail.text;
    String password = _ctrlPassword.text;
    String firstname = _ctrlFirstname.text;
    String middlename = _ctrlMiddlename.text;
    String lastname = _ctrlLastname.text;
    String mobile = _ctrlMobile.text;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("$username\n$email\n$password"),
    ));
  }

  void _onSignup() {
    String username = _ctrlUsername.text;
    String email = _ctrlEmail.text;
    String password = _ctrlPassword.text;
    String firstname = _ctrlFirstname.text;
    String middlename = _ctrlMiddlename.text;
    String lastname = _ctrlLastname.text;
    String mobile = _ctrlMobile.text;
    int role = _roles.indexOf(_selectedRole);
  }

  @override
  Widget build(BuildContext context) {
    var contTitle = Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 30),
      child: Text(
        "Signup",
        style: TextStyle(
            color: _theme!.colorScheme.primary,
            fontSize: 50,
            fontWeight: FontWeight.bold),
      ),
    );
    var form = Form(
        key: const Key("Signup-form"),
        child: Column(
          children: [
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
                  controller: _ctrlMobile,
                  decoration: const InputDecoration(
                      fillColor: Colors.white54,
                      hoverColor: Color(colorHighlightDark),
                      label: Text("Mobile phone"),
                      hintText: "0123456789"),
                )),
            /*
                DropdownButtonFormField<String>(
                  value: _selectedRole,
                  onChanged: (selected) {
                    setState(() {
                      _selectedRole = selected!;
                    });
                  },
                  items: _roles.map((role) {
                    return DropdownMenuItem<String>(
                      value: role,
                      child: Text(role),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    labelText: 'Role',
                    hintText: 'Select a role',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please select a role";
                    }
                    return null;
                  },
                ),*/
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Login(
                                    onLogin: _login,
                                  )));
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
                        backgroundColor:
                            MaterialStateProperty.all(_theme!.highlightColor)),
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
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomeScreen()));
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          color: _theme!.colorScheme.primary,
                          fontWeight: FontWeight.bold),
                    )))
          ],
        ));
    return Container(
      alignment: Alignment.topCenter,
      width: 600,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(colorSecondaryLightBrand)),
      child: ListView(children: [contTitle, form]),
    );
  }
}
