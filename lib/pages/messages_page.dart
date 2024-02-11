import 'package:flutter/material.dart';
import 'package:messageapp/controllers/message_controller.dart';
import 'package:messageapp/models/message_model.dart';
import 'package:messageapp/models/user_model.dart';
import 'package:http/http.dart' as http;

class MessagesPage extends StatelessWidget {
  const MessagesPage({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final messageController = MessageController();
    late List<MessageModel> message;
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
        title: Row(
          children: [
            ClipOval(
              child: Image.network(
                user.photoUrl ?? '',
                scale: 3,
              ),
            ),
            const Spacer(),
            Text.rich(
              textAlign: TextAlign.start,
              TextSpan(
                children: [
                  TextSpan(text: user.name),
                  TextSpan(
                    text: '\nOnline',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Colors.white54,
                        ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 10),
          ],
        ),
      ),
      body: FutureBuilder(
        future: http.get(messageController.getMessages()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            messageController.convertJsonMessage(snapshot.data?.body);
            message = messageController.allMessages(user.id ?? '');
            return bodyReturn(message);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(seconds: 2),
        color: Colors.amber,
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            const Flexible(
              child: TextField(
                minLines: 1,
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.send),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget bodyReturn(List<MessageModel> sms) => sms.isNotEmpty
      ? ListView.builder(
          itemCount: sms.length,
          itemBuilder: (context, index) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                flex: 2,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).primaryColor.withOpacity(.2),
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 8,
                  ),
                  child: Text(
                    sms[index].content,
                    textAlign: TextAlign.justify,
                    softWrap: true,
                  ),
                ),
              ),
              const Spacer()
            ],
          ),
        )
      : Image.asset('assets/images/no_messages.png');
}
