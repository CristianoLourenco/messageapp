import 'package:flutter/material.dart';
import 'package:messageapp/controllers/message_controller.dart';
import 'package:messageapp/models/message_model.dart';
import 'package:messageapp/models/user_model.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  late TextEditingController sendMessageController;
  late MessageController messageController;
  late List<MessageModel> messages;
  late ThemeData theme;

  @override
  void initState() {
    sendMessageController = TextEditingController();
    messageController = MessageController();
    messages = <MessageModel>[];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        titleTextStyle: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        backgroundColor: theme.primaryColor,
        iconTheme: theme.iconTheme.copyWith(color: Colors.white),
        title: Row(
          children: [
            ClipOval(
              child: Image.network(
                widget.user.photoUrl ?? '',
                scale: 3,
              ),
            ),
            const Spacer(),
            Text.rich(
              textAlign: TextAlign.start,
              TextSpan(
                children: [
                  TextSpan(text: widget.user.name),
                  TextSpan(
                    text: '\nOnline',
                    style: theme.textTheme.labelSmall?.copyWith(
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
        future: messageController.convertJsonMessage(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            messageController.convertJsonMessage();
            messages = messageController.allMessages(widget.user.id ?? '');
            return bodyReturn(messages);
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
            Flexible(
              child: TextField(
                controller: sendMessageController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                ),
                minLines: 1,
                maxLines: 4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: IconButton(
                onPressed: sendMessage,
                icon: const Icon(Icons.send),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget bodyReturn(List<MessageModel> sms) {
    return sms.isEmpty
        ? Image.asset('assets/images/no_messages.png')
        : ListView.builder(
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
                      color: theme.primaryColor.withOpacity(.2),
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
          );
  }

  void sendMessage() async {}
}
