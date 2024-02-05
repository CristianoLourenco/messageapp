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
