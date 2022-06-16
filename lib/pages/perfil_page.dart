import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sincroneasy/helpers/styles.dart';
import 'package:sincroneasy/widgets/modal_bottom_config.dart';

import '../models/user_client.dart';
import '../services/auth_service.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final UserClient _user = UserClient();
  bool _isHovering = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 40, child: Image.asset('assets/icons/favicon.png')),
            SizedBox(
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
              children: [
                const SizedBox(
                  height: 12,
                ),
                Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                const SizedBox(
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
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              bottom: -22,
              left: 0,
              right: 0,
              child: SizedBox(
                  width: 45,
                  height: 45,
                  child: CircleAvatar(
                    child: Image(image: NetworkImage(_user.getFoto)),
                    radius: 45,
                  )),
            ),
            customText(_user.getName, 22, Colors.black, FontWeight.bold)
          ],
        ),
      ),
    );
  }
}
