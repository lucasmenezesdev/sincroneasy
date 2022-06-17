import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sincroneasy/helpers/styles.dart';

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
          SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(110, 45),
                ),
                onPressed: () {},
                child:
                    customText('Entrar', 18, Colors.white, FontWeight.normal),
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
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(110, 45),
                ),
                onPressed: () {},
                child: customText('Gmail', 18, Colors.white, FontWeight.normal),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(230, 45),
              ),
              onPressed: () {},
              child:
                  customText('Register', 18, Colors.white, FontWeight.normal))
        ],
      ),
    );
  }
}
