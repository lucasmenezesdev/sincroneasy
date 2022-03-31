import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sincroneasy/helpers/styles.dart';

import '../services/auth_service.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  logOut() async {
    await context.read<AuthService>().logout();
  }

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
              logOut();
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Sair",
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: _isHovering ? Colors.black : orange,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
