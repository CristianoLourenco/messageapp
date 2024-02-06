import 'dart:convert';

import 'package:messageapp/models/message_model.dart';

class MessageController {
  final messages = <MessageModel>[];

  Uri getMessages() {
    final uri = Uri.parse(
        'https://65527d4c5c69a779032a1a48.mockapi.io/getinfoapp/messages');
    return uri;
  }

  void convertJsonMessage(dynamic json) {
    final smsJson = jsonDecode(json) as List<dynamic>;

    for (var data in smsJson) {
      messages.add(MessageModel.fromJson(data));
    }
  }

  List<MessageModel> allMessages(String id) {
    final allMessages = messages.where((sms) => sms.senderId == id).toList();
    return allMessages;
  }
}
