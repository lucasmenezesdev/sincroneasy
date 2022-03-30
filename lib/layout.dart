import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sincroneasy/helpers/styles.dart';
import 'package:sincroneasy/pages/chat_page.dart';
import 'package:sincroneasy/pages/home_page.dart';
import 'package:sincroneasy/pages/perfil_page.dart';
import 'package:sincroneasy/widgets/Layout/find_dialog.dart';
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
    return Scaffold(
      body: PageView(
        controller: pc,
        children: [
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
        onPressed: () {
          showBarModalBottomSheet(
              context: context, builder: (context) => Container());
        },
        child: SizedBox(
          child: Image.asset('assets/icons/favicon.png'),
          height: 40,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Início'),
          BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined), label: 'Agenda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_answer_outlined), label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity), label: 'Chat'),
        ],
        onTap: (pagina) {
          pc.animateToPage(
            pagina,
            duration: const Duration(milliseconds: 400),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}
