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

  late TextEditingController textControllerLastname = TextEditingController();
  late FocusNode textFocusNodeLastname;
  bool _isEditingLastname = false;

  late TextEditingController textControllerEmail = TextEditingController();
  late FocusNode textFocusNodeEmail;
  bool _isEditingEmail = false;

  late TextEditingController textControllerPhone = TextEditingController();
  late FocusNode textFocusNodePhone;
  bool _isEditingPhone = false;

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
      await context.read<AuthService>().writeUser(
          textControllerName.text,
          textControllerLastname.text,
          textControllerEmail.text,
          textControllerPhone.text);
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
    textControllerLastname = TextEditingController();
    textControllerLastname.text = '';
    textFocusNodeLastname = FocusNode();
    textControllerEmail = TextEditingController();
    textControllerEmail.text = '';
    textFocusNodeEmail = FocusNode();
    textControllerPhone = TextEditingController();
    textFocusNodePhone = FocusNode();
    textControllerPhone.text = '';
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
      body: ListView(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                  autofocus: true,
                  onChanged: (value) {
                    setState(() {
                      _isEditingName = true;
                    });
                  },
                  onSubmitted: (value) {
                    textFocusNodeName.unfocus();
                    FocusScope.of(context).requestFocus(textFocusNodeLastname);
                  },
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Nome',
                    hintText: 'Seu Nome',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    prefixIcon: Icon(Icons.person),
                    contentPadding: EdgeInsets.only(right: 30),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 300,
                child: TextField(
                  focusNode: textFocusNodeLastname,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  controller: textControllerLastname,
                  autofocus: false,
                  onChanged: (value) {
                    setState(() {
                      _isEditingLastname = true;
                    });
                  },
                  onSubmitted: (value) {
                    textFocusNodeLastname.unfocus();
                    FocusScope.of(context).requestFocus(textFocusNodeEmail);
                  },
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Sobrenome',
                    hintText: 'Seu Sobrenome',
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
                    FocusScope.of(context).requestFocus(textFocusNodePhone);
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
                  focusNode: textFocusNodePhone,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  controller: textControllerPhone,
                  autofocus: false,
                  onChanged: (value) {
                    setState(() {
                      _isEditingPhone = true;
                    });
                  },
                  onSubmitted: (value) {
                    textFocusNodePhone.unfocus();
                    FocusScope.of(context).requestFocus(textFocusNodePassword);
                  },
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Telefone',
                    hintText: '+99 9 99999999',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    prefixIcon: Icon(Icons.phone),
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
                          .requestFocus(textFocusNodePasswordRepeat);
                    },
                    obscureText: visiblePassword,
                    style: TextStyle(),
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Senha',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      prefixIcon: Icon(Icons.lock),
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
                    autofocus: false,
                    onChanged: (value) async {
                      setState(() {
                        _isEditingPasswordRepeat = true;
                      });
                    },
                    onSubmitted: (value) {
                      textFocusNodePasswordRepeat.unfocus();
                    },
                    obscureText: visiblePassword,
                    style: TextStyle(),
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Repita a senha',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      prefixIcon: Icon(Icons.lock),
                    ),
                  )),
              SizedBox(
                height: 25,
              ),
              CustomButton(
                onPressed: () async {
                  register();
                },
                text: 'Confirmar',
                color: blue,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
