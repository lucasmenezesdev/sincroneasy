import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sincroneasy/helpers/styles.dart';

class Initial extends StatelessWidget {
  const Initial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(''),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: customText('Entrar', 18, Colors.white, FontWeight.normal),
            ),
            Container(
              color: Colors.grey,
              width: 2,
            ),
            ElevatedButton(
              onPressed: () {},
              child: customText('Entrar', 18, Colors.white, FontWeight.normal),
            ),
          ],
        )
      ],
    );
  }
}
