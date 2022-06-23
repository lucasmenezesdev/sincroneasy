import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:sincroneasy/helpers/styles.dart';
import 'package:sincroneasy/repositories/user_client.dart';
import 'package:sincroneasy/pages/chat_page.dart';
import 'package:sincroneasy/pages/home_page.dart';
import 'package:sincroneasy/pages/perfil_page.dart';
import 'package:sincroneasy/services/auth_service.dart';
import 'package:sincroneasy/services/firestore_db.dart';
import 'package:sincroneasy/services/user_data_controller.dart';
import 'package:sincroneasy/widgets/modal_bottom_sinc.dart';
import 'pages/agenda_page.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    UserDataController getUserData = UserDataController(context: context);
    getUserData.getUserData();
    return Scaffold(
      body: PageView(
        controller: pc,
        children: const [
          HomePage(),
          AgendaPage(),
          ChatPage(),
          PerfilPage(),
        ],
        onPageChanged: setPaginaAtual,
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () async {
          modal_bottom_sinc(context);
        },
        child: SizedBox(
          child: Image.asset('assets/icons/sincicon.png'),
          height: 60,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Início'),
          BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined), label: 'Agenda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_answer_outlined), label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity), label: 'Perfil'),
        ],
        onTap: (pagina) {
          pc.animateToPage(
            pagina,
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
          );
        },
      ),
    );
  }
}
