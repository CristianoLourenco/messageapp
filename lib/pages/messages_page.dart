import 'package:flutter/material.dart';
import 'package:messageapp/models/user_model.dart';

class MessagesPage extends StatelessWidget {
  final UserModel user;
  const MessagesPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
