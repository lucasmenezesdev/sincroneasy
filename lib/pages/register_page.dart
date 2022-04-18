import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../helpers/styles.dart';
import '../services/auth_service.dart';
import '../widgets/custom_button_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController textControllerName = TextEditingController();
  late FocusNode textFocusNodeName;
  bool _isEditingName = false;

  late TextEditingController textControllerEmail = TextEditingController();
  late FocusNode textFocusNodeEmail;
  bool _isEditingEmail = false;

  late TextEditingController textControllerPassword = TextEditingController();
  late FocusNode textFocusNodePassword;
  bool _isEditingPassword = false;

  late TextEditingController textControllerPasswordRepeat =
      TextEditingController();
  late FocusNode textFocusNodePasswordRepeat;
  bool _isEditingPasswordRepeat = false;

  bool visiblePassword = true;
  bool _isHovering = false;

  bool _isLoggingIn = false;
  bool _isProcessing = false;
  bool loading = false;

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
    textControllerName = TextEditingController();
    textControllerName.text = '';
    textFocusNodeName = FocusNode();
    textControllerEmail = TextEditingController();
    textControllerEmail.text = '';
    textFocusNodeEmail = FocusNode();
    textControllerPassword = TextEditingController();
    textControllerPassword.text = '';
    textFocusNodePassword = FocusNode();
    textControllerPasswordRepeat = TextEditingController();
    textControllerPasswordRepeat.text = '';
    textFocusNodePasswordRepeat = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 120,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Registrar',
                style: GoogleFonts.montserrat(
                    fontSize: 25, color: blue, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 300,
                child: TextField(
                  focusNode: textFocusNodeName,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  controller: textControllerName,
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
                    labelText: 'Nome',
                    hintText: 'exemplo@dominio.com',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    prefixIcon: Icon(Icons.person),
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
                height: 30,
              ),
              Container(
                  width: 300,
                  child: TextField(
                    focusNode: textFocusNodePasswordRepeat,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    controller: textControllerPasswordRepeat,
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
                      labelText: 'Repita a senha',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      prefixIcon: Icon(Icons.password),
                    ),
                  )),
              SizedBox(
                height: 25,
              ),
              CustomButton(onPressed: () async {}, text: 'Confirmar'),
            ],
          ),
        ),
      ),
    );
  }
}
