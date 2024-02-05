import 'package:flutter/material.dart';
import 'package:messageapp/models/user_model.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          children: [
            ClipOval(
              child: Image.network(
                user.photoUrl ?? '',
                scale: 3,
              ),
            ),
            const Spacer(),
            Text(
              user.name,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            const Spacer(flex: 5),
          ],
        ),
      ),
      body: Container(),
      bottomNavigationBar: const BottomAppBar(
        child: Row(
          children: [
            Expanded(
              child: TextField(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.send),
      ),
    );
  }
}
