// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:messageapp/controllers/user_controller.dart';
import 'package:messageapp/pages/messages_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final users = UserController().allUsers();
    final theme = Theme.of(context);
    final dataFormat = DateFormat.yMd();
    final hour = DateFormat.Hm();

    return Scaffold(
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  minVerticalPadding: 20,
                  tileColor:
                      theme.colorScheme.onPrimaryContainer.withOpacity(.05),
                  title: Text(
                    users[index].name,
                    style: theme.textTheme.titleMedium,
                  ),
                  subtitle: Text(
                    "last message",
                    style: theme.textTheme.labelSmall,
                  ),
                  leading: ClipOval(
                    child: FadeInImage.assetNetwork(
                      placeholder: users[index].placeHolder,
                      image: (users[index].photoUrl ?? ''),
                    ),
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(hour.format(DateTime.now())),
                      const SizedBox(height: 5),
                      CircleAvatar(
                        radius: 11,
                        child: Text(
                          "10",
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style:
                              theme.textTheme.bodySmall?.copyWith(fontSize: 10),
                        ),
                      )
                    ],
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MessagesPage(user: users[index]);
                      },
                    ),
                  ),
                ),
                const Divider(height: 0.01),
              ],
            );
          }),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        height: 90,
        child: Stack(children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.message),
                      label: const Text("message"),
                      style: FilledButton.styleFrom(
                        minimumSize:
                            const Size(double.maxFinite, double.maxFinite),
                        shape: const RoundedRectangleBorder(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.person),
                      label: const Text("contacts"),
                      style: FilledButton.styleFrom(
                        minimumSize:
                            const Size(double.maxFinite, double.maxFinite),
                        shape: const RoundedRectangleBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            heightFactor: .5,
            child: FloatingActionButton(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              onPressed: () {},
              child: const Text("+"),
            ),
          ),
        ]),
      ),
    );
  }
}
