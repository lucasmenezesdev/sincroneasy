import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sincroneasy/services/auth_service.dart';

import '../helpers/styles.dart';

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
      body: ListView.separated(
        itemBuilder: (BuildContext context, int moeda) {
          return ListTile(
              leading: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/sincroneasy-app.appspot.com/o/users%2Fclients%2FNlIP8K756Sec8ZTpRQ7aNeMu6312%2Fprofile%2FProfile_Image?alt=media&token=7e151a4b-b8db-4548-8a13-2b91b106645b"),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText('Nome', 18, Colors.black, FontWeight.normal),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customText('Profissão', 12, Colors.black, FontWeight.normal),
                ],
              ));
        },
        separatorBuilder: (_, __) => const Divider(),
        itemCount: 10,
      ),
    );
  }
}
