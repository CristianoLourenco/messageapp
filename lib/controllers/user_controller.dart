import 'package:messageapp/config/firebase_config.dart';
import 'package:messageapp/models/response_status_model.dart';
import 'package:messageapp/models/user_model.dart';

final _users = <UserModel>[];
late UserModel? _logedUser;

class UserController {
  Future<ResponseStatusModel> convertJsonUsers() async {
    _users.clear();
    final db = await getFirebaseUsers.get();

    for (var user in db.docs) {
      _users.add(user.data());
    }

    if (_users.isNotEmpty) {
      return ResponseStatusModel(statusCode: 200);
    }
    return ResponseStatusModel();
  }

  List<UserModel> allUsers() {
    final allUsers = _users.where((u) => u.id != _logedUser?.id).toList();
    allUsers.sort((a, b) => a.name.compareTo(b.name));
    return allUsers;
  }

  void getLogedUser(String phone, String passWord) {
    final listProbabelUsers = _users
        .where((u) => u.phoneNumber == phone && u.passWord == passWord)
        .toList();
    if (listProbabelUsers.isNotEmpty) {
      _logedUser = listProbabelUsers.first;
    } else {
      _logedUser = null;
    }
  }

  UserModel? logedUser() => _logedUser;
}
