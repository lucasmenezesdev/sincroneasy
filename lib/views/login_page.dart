import 'package:flutter/material.dart';
import 'package:sincroneasy/helpers/styles.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController textControllerEmail = TextEditingController();
  late FocusNode textFocusNodeEmail;
  bool _isEditingEmail = false;

  late TextEditingController textControllerPassword = TextEditingController();
  late FocusNode textFocusNodePassword;
  bool _isEditingPassword = false;

  bool visiblePassword = true;
  bool _isHovering = false;

  String? _validateEmail(String value) {
    value = value.trim();

    if (textControllerEmail.text.isNotEmpty) {
      if (value.isEmpty) {
        return 'Email can\'t be empty';
      } else if (!value.contains(RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
        return 'Coloque um e-mail válido';
      }
    }
    return null;
  }

  @override
  void initState() {
    textControllerEmail = TextEditingController();
    textControllerEmail.text = '';
    textFocusNodeEmail = FocusNode();
    textControllerPassword = TextEditingController();
    textControllerPassword.text = '';
    textFocusNodePassword = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Text('')),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: orange,
            ),
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  child: TextField(
                    focusNode: textFocusNodeEmail,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    controller: textControllerEmail,
                    autofocus: false,
                    onChanged: (value) {
                      setState(() {
                        _isEditingEmail = true;
                      });
                    },
                    onSubmitted: (value) {
                      textFocusNodeEmail.unfocus();
                      FocusScope.of(context).requestFocus(textFocusNodeEmail);
                    },
                    decoration: InputDecoration(
                      errorText: _isEditingEmail
                          ? _validateEmail(textControllerEmail.text)
                          : null,
                      errorStyle: TextStyle(
                        fontSize: 12,
                        color: Colors.redAccent,
                      ),
                      filled: true,
                      labelText: 'E-mail',
                      hintText: 'exemplo@dominio.com',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      prefixIcon: Icon(Icons.email),
                      contentPadding: EdgeInsets.only(right: 30),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    width: 300,
                    child: TextField(
                      focusNode: textFocusNodePassword,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      controller: textControllerPassword,
                      autofocus: true,
                      onChanged: (value) async {
                        setState(() {
                          _isEditingPassword = true;
                        });
                      },
                      onSubmitted: (value) {
                        textFocusNodePassword.unfocus();
                        FocusScope.of(context)
                            .requestFocus(textFocusNodePassword);
                      },
                      obscureText: visiblePassword,
                      style: TextStyle(),
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'Senha',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        prefixIcon: Icon(Icons.password),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
