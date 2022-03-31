import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sincroneasy/services/auth_service.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    AuthService _auth = Provider.of<AuthService>(context);

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
        actions: [],
      ),
      body: ElevatedButton(
        child: Text(''),
        onPressed: () {
          print(_auth.user?.email);
        },
      ),
    );
  }
}
