import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sincroneasy/helpers/styles.dart';
import 'package:sincroneasy/models/user_client.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({Key? key}) : super(key: key);

  @override
  _AgendaPageState createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  @override
  Widget build(BuildContext context) {
    UserClient userClient = Provider.of<UserClient>(context);
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
                  customText('${userClient.getName}', 18, Colors.black,
                      FontWeight.normal),
                  customText('Serviço', 14, Colors.black, FontWeight.normal),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customText('21/06/2022', 12, Colors.black, FontWeight.normal),
                  customText('14:30', 14, Colors.black, FontWeight.normal),
                ],
              ));
        },
        separatorBuilder: (_, __) => const Divider(),
        itemCount: 10,
      ),
    );
  }
}
