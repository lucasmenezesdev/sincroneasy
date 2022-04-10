import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:sincroneasy/helpers/styles.dart';
import 'package:sincroneasy/pages/register_page.dart';
import 'package:sincroneasy/services/auth_service.dart';
import 'package:sincroneasy/widgets/custom_button_widget.dart';

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

  bool _isLoggingIn = false;
  bool _isProcessing = false;
  bool loading = false;

  login() async {
    setState(() => _isLoggingIn = true);
    try {
      await context
          .read<AuthService>()
          .login(textControllerEmail.text, textControllerPassword.text);
    } on AuthException catch (e) {
      setState(() => _isLoggingIn = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message),
      ));
    }
  }

  register() async {
    setState(() => loading = true);
    try {
      await context
          .read<AuthService>()
          .register(textControllerEmail.text, textControllerPassword.text);
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message),
      ));
    }
  }

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
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Login',
                  style: GoogleFonts.montserrat(
                      fontSize: 25, color: blue, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
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
                SizedBox(
                  height: 25,
                ),
                CustomButton(
                    onPressed: () async {
                      login();
                    },
                    text: 'Confirmar'),
                InkWell(
                  hoverColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      _isHovering = true;
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => RegisterPage()));
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Cadastrar",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: _isHovering ? Colors.black : cream,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
                // ElevatedButton(
                //     onPressed: () async {
                //       print('Teste');
                //       setState(() {
                //         _isProcessing = true;
                //       });
                //       await context
                //           .read<AuthService>()
                //           .signInWithGoogle()
                //           .then((result) {
                //         print(result);
                //         if (result != null) {
                //           Navigator.of(context).pop();
                //         }
                //       }).catchError((error) {
                //         print('Registration Error: $error');
                //       });
                //       setState(() {
                //         _isProcessing = false;
                //       });
                //     },
                //     child: Text('teste')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
