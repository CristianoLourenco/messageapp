import 'dart:convert';

import 'package:messageapp/models/user_model.dart';

final _users = <UserModel>[];
late UserModel? _logedUser;

class UserController {
  Uri getUsers() {
    final uri = Uri.parse(
        'https://65527d4c5c69a779032a1a48.mockapi.io/getinfoapp/users');
    return uri;
  }

  void convertJsonUsers(dynamic json) {
    final usersJson = jsonDecode(json) as List<dynamic>;

    for (var data in (usersJson)) {
      _users.add(UserModel.fromJson(data));
    }
  }

  List<UserModel> allUsers() {
    final allUsers = _users;
    return allUsers;
  }

  bool logIn(String phone, String passWord) {
    final listProbabelUsers = _users
        .where((u) => u.phoneNumber == phone && u.passWord == passWord)
        .toList();
    if (listProbabelUsers.isNotEmpty) {
      _logedUser = listProbabelUsers.first;
    } else {
      _logedUser = null;
    }
    return listProbabelUsers.isNotEmpty;
  }

  UserModel? logedUser() => _logedUser;
}
