import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sincroneasy/helpers/styles.dart';
import 'package:sincroneasy/widgets/custom_button_widget.dart';
import 'package:sincroneasy/widgets/modal_bottom_config.dart';

import '../models/user_client.dart';
import '../services/auth_service.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  String url =
      "https://firebasestorage.googleapis.com/v0/b/sincroneasy-app.appspot.com/o/users%2Fclients%2FNlIP8K756Sec8ZTpRQ7aNeMu6312%2Fprofile%2FProfile_Image?alt=media&token=7e151a4b-b8db-4548-8a13-2b91b106645b";
  bool _isHovering = false;
  navigate() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 40, child: Image.asset('assets/icons/favicon.png')),
            const SizedBox(
              width: 10,
            ),
            SizedBox(width: 120, child: Image.asset('assets/icons/slogo.png')),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          InkWell(
            onHover: (value) {
              setState(() {
                value ? _isHovering = true : _isHovering = false;
              });
            },
            hoverColor: Colors.transparent,
            onTap: () {
              modal_bottom_config(context);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                SizedBox(
                  height: 12,
                ),
                Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: Column(
        children: [
          Flexible(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                    child: Container(color: Colors.black.withOpacity(0)),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                          image: NetworkImage(url), fit: BoxFit.cover)),
                ),
                Positioned(
                  bottom: -50,
                  left: 0,
                  right: 0,
                  child: Center(
                      child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              const BoxShadow(
                                  color: Colors.white, spreadRadius: 4),
                            ],
                            image: DecorationImage(
                                fit: BoxFit.cover, image: NetworkImage(url)),
                          ))),
                ),
              ],
            ),
            flex: 5,
          ),
          const Spacer(),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: customText('nome', 22, Colors.black, FontWeight.w500),
            ),
            flex: 1,
          ),
          const Spacer(),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: orange,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Faça upgrade de sua conta de cliente e seja um prestador de serviços Sincroneasy, garanta já seu plano com 3 meses gratuitos!',
                        style: TextStyle(
                            color: blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    CustomButton(
                      text: 'VER PLANOS',
                      onPressed: () {},
                      color: blue,
                    )
                  ],
                ),
              ),
            ),
            flex: 7,
          )
        ],
      ),
    );
  }
}
