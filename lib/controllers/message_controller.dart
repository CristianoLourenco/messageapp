import 'package:messageapp/models/message_model.dart';

class MessageController {
  Uri getMessages() {
    final uri = Uri.parse(
        'https://65527d4c5c69a779032a1a48.mockapi.io/getinfoapp/messages');
    return uri;
  }

  void convertJsonMessage(dynamic json) {
    final messages = <MessageModel>[];
    print(json);
    /*for (var data in json) {
      messages.add(MessageModel.fromJson(data));
    }*/
  }
}
