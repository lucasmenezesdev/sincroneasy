import 'package:flutter/material.dart';
import 'package:sincroneasy/helpers/styles.dart';
import 'package:sincroneasy/widgets/icon_favorites.dart';
import 'package:sincroneasy/widgets/icon_most_used.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dropvalue = ValueNotifier('');
  final dropOptions = ['Mais Avaliados', 'Mais Novos', 'Próximos'];
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
        actions: [],
      ),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: TextField(
              cursorColor: orange,
              //controller: controller,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'pesquisar',
                floatingLabelAlignment: FloatingLabelAlignment.center,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:
                      BorderSide(color: orange, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(left: 15, right: 15),
            child: ValueListenableBuilder(
              valueListenable: dropvalue,
              builder: (BuildContext context, String value, _) {
                return DropdownButton<String>(
                    icon: const Icon(Icons.sort),
                    hint: const Text('filtrar'),
                    value: (value.isEmpty) ? null : value,
                    items: dropOptions
                        .map((option) => DropdownMenuItem(
                            value: option, child: Text(option)))
                        .toList(),
                    onChanged: (chosen) => dropvalue.value = chosen.toString());
              },
            ),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                width: screenSize(context).width - 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image.asset('assets/images/capa1.png'),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              margin: EdgeInsets.only(left: 15),
              child:
                  customText('Favoritos', 20, Colors.black, FontWeight.bold)),
          SizedBox(
            height: 90,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.only(left: 15),
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: IconFavorites(),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              margin: EdgeInsets.only(left: 15),
              child: customText(
                  'Mais utilizados', 20, Colors.black, FontWeight.bold)),
          SizedBox(
            height: 115,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.only(left: 15),
                child: IconMostUsed(),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              margin: EdgeInsets.only(left: 15),
              child: customText('Recentes', 20, Colors.black, FontWeight.bold)),
          SizedBox(
            height: 90,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.only(left: 15),
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: IconFavorites(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
