import 'dart:convert';

import 'package:messageapp/models/user_model.dart';

final users = <UserModel>[];

class UserController {
  Uri getUsers() {
    final uri = Uri.parse(
        'https://65527d4c5c69a779032a1a48.mockapi.io/getinfoapp/users');
    return uri;
  }

  void convertJsonUsers(dynamic json) {
    final t = jsonDecode(json) as List<dynamic>;

    for (var data in (t)) {
      users.add(UserModel.fromJson(data));
    }
  }

  List<UserModel> allUsers() {
    final allUsers = users;
    return allUsers;
  }
}
