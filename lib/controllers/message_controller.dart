import 'package:messageapp/config/firebase_config.dart';
import 'package:messageapp/controllers/user_controller.dart';
import 'package:messageapp/models/message_model.dart';
import 'package:messageapp/models/response_status_model.dart';

final _messages = <MessageModel>[];

class MessageController {
  Future<ResponseStatusModel> convertJsonMessage() async {
    _messages.clear();
    final data = await getFirebaseMessage.get();

    for (var sms in data.docs) {
      _messages.add(sms.data());
    }

    if (_messages.isNotEmpty) {
      return ResponseStatusModel(statusCode: 200);
    }
    return ResponseStatusModel();
  }

  Future<void> sendMessage(MessageModel model) async {
    await getFirebaseMessage.add(model);
  }

  List<MessageModel> allMessages(String senderId) {
    final logedUser = UserController().logedUser();
    final allMessages = _messages
        .where((sms) =>
            sms.senderId == senderId || sms.receiverId == logedUser?.id)
        .toList();

    allMessages.sort((a, b) =>
        a.createdDate?.compareTo(b.createdDate ?? DateTime(1999)) ?? 0);

    return allMessages;
  }

/* MOCKAPI
  convertTojson
   


    sendMessage
      print(body);
    final response = await http.post(_getMessages(), body: body);
    print(response.statusCode);
    */
}
