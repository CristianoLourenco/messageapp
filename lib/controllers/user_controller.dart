import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:messageapp/models/response_status_model.dart';
import 'package:messageapp/models/user_model.dart';

final _users = <UserModel>[];
late UserModel? _logedUser;

class UserController {
  Uri _getUsers() {
    final uri = Uri.parse(
        'https://65527d4c5c69a779032a1a48.mockapi.io/getinfoapp/users');
    return uri;
  }

  Future<ResponseStatusModel> convertJsonUsers() async {
    http.Response response = await http.get(_getUsers());
    final responseStatus = ResponseStatusModel(
      message: response.reasonPhrase ?? '',
      statusCode: response.statusCode,
    );
    if (response.statusCode == 200) {
      final usersJson = jsonDecode(response.body) as List<dynamic>;
      for (var data in (usersJson)) {
        _users.add(UserModel.fromJson(data));
      }
      return responseStatus;
    }
    return responseStatus;
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
