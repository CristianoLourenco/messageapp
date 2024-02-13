import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:messageapp/controllers/user_controller.dart';
import 'package:messageapp/models/message_model.dart';
import 'package:messageapp/models/response_status_model.dart';

final _messages = <MessageModel>[];

class MessageController {
  Uri _getMessages() {
    final uri = Uri.parse(
        'https://65527d4c5c69a779032a1a48.mockapi.io/getinfoapp/messages');
    return uri;
  }

  Future<ResponseStatusModel> convertJsonMessage() async {
    _messages.clear();
    http.Response response = await http.get(_getMessages());
    final responseStatus = ResponseStatusModel(
      message: response.reasonPhrase ?? '',
      statusCode: response.statusCode,
    );
    if (response.statusCode == 200) {
      final smsJson = jsonDecode(response.body) as List<dynamic>;
      for (var sms in smsJson) {
        _messages.add(MessageModel.fromJson(sms));
      }
      return responseStatus;
    }
    return responseStatus;
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
}
