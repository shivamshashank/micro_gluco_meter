import 'package:flutter/cupertino.dart';
import 'package:micro_gluco_meter/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  set user(UserModel? value) {
    _user = value;
    notifyListeners();
  }
}
