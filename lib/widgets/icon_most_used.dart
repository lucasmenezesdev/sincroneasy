import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class IconMostUsed extends StatelessWidget {
  const IconMostUsed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 115,
        width: 220,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.black),
      ),
    );
  }
}
