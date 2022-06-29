import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sincroneasy/repositories/user_client.dart';

class HomePageController extends ChangeNotifier {
  late BuildContext _context;

  printFavorites(BuildContext context) {
    _context = context;
    UserClient user = Provider.of<UserClient>(_context);
    print(user.getFavorites);
  }
}
