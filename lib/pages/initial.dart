import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sincroneasy/helpers/styles.dart';
import 'package:sincroneasy/pages/login_page.dart';
import 'package:sincroneasy/pages/register_page.dart';

class Initial extends StatelessWidget {
  const Initial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: cream,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 45,
            child: Image.asset('assets/icons/slogo.png'),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => LoginPage()));
                  },
                  child:
                      customText('Entrar', 20, Colors.white, FontWeight.normal),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  color: Colors.grey,
                  width: 1,
                  height: 45,
                ),
                SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => RegisterPage()));
                  },
                  child: customText(
                      'Registrar', 20, Colors.white, FontWeight.normal),
                ),
              ],
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(224, 45),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Image.asset('assets/icons/google.png'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  customText('Gmail', 20, Colors.white, FontWeight.normal),
                ],
              ))
        ],
      ),
    );
  }
}
