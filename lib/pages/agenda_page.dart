import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sincroneasy/controllers/agenda_controller.dart';
import 'package:sincroneasy/helpers/styles.dart';
import 'package:sincroneasy/repositories/user_client.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({Key? key}) : super(key: key);

  @override
  _AgendaPageState createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  @override
  Widget build(BuildContext context) {
    UserClient userClient = Provider.of<UserClient>(context);
    List services = userClient.getServices;
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
        itemBuilder: (BuildContext context, int service) {
          return ListTile(
              leading: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(services[service].providerImage),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(services[service].providerName, 18, Colors.black,
                      FontWeight.normal),
                  customText(services[service].service, 14, Colors.black,
                      FontWeight.normal),
                ],
              ),
              trailing: SizedBox(
                width: 100,
                height: 20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customText('${services[service].date}', 12, Colors.black,
                        FontWeight.normal),
                  ],
                ),
              ));
        },
        separatorBuilder: (_, __) => const Divider(),
        itemCount: services.length,
        padding: EdgeInsets.only(right: 10, left: 10),
      ),
    );
  }
}
