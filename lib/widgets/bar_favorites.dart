import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:sincroneasy/repositories/user_client.dart';
import 'package:sincroneasy/services/auth_service.dart';
import 'package:sincroneasy/widgets/icon_favorites.dart';
import 'package:collection/collection.dart';

import '../helpers/styles.dart';

class BarFavorites extends StatefulWidget {
  const BarFavorites({Key? key}) : super(key: key);

  @override
  State<BarFavorites> createState() => _BarFavoritesState();
}

class _BarFavoritesState extends State<BarFavorites> {
  @override
  Widget build(BuildContext context) {
    Function eq = const ListEquality().equals;
    UserClient user = Provider.of<UserClient>(context);
    AuthService auth = Provider.of<AuthService>(context);
    List list = [];
    return Container(
        child: eq(user.getFavorites, list)
            ? Container()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 15),
                      child: customText(
                          'Favoritos', 20, Colors.black, FontWeight.bold)),
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
              ));
  }
}
