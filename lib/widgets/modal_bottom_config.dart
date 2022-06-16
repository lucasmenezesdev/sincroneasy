import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:sincroneasy/helpers/styles.dart';

import '../services/auth_service.dart';

modal_bottom_config(BuildContext context) {
  showBarModalBottomSheet(
      context: context,
      builder: (context) => SizedBox(
            height: 130,
            child: Column(
              children: [
                ListTile(
                  title: customText(
                      'Assinatura', 20, Colors.black, FontWeight.normal),
                  onTap: () async {},
                ),
                ListTile(
                  title:
                      customText('Sair', 20, Colors.black, FontWeight.normal),
                  onTap: () async {
                    await context.read<AuthService>().logout();
                  },
                ),
              ],
            ),
          ));
}
