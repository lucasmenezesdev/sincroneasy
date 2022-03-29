import 'package:flutter/material.dart';
import 'package:sincroneasy/helpers/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
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
                      width: screenSize(context) - 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Image.asset('assets/images/capa1.png'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}