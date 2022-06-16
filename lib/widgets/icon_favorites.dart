import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class IconFavorites extends StatelessWidget {
  //String uid;
  const IconFavorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: SizedBox(
          height: 90,
          width: 90,
          child: CircleAvatar(
            backgroundColor: Colors.red,
          ),
        ));
  }
}
