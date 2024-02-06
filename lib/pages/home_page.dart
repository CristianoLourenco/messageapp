import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:messageapp/controllers/message_controller.dart';
import 'package:messageapp/controllers/user_controller.dart';
import 'package:messageapp/pages/messages_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = UserController();

    final textTheme = Theme.of(context).textTheme;
    final dataFormat = DateFormat.yMd();
    final hour = DateFormat.Hm();

    return Scaffold(
      body: FutureBuilder(
        future: http.get(userController.getUsers()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            userController.convertJsonUsers(snapshot.data!.body);
            final users = userController.allUsers();
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    minVerticalPadding: 20,
                    tileColor: Theme.of(context)
                        .colorScheme
                        .onPrimaryContainer
                        .withOpacity(.05),
                    title: Text(
                      users[index].name,
                      style: textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      "last message",
                      style: textTheme.labelSmall,
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
                            style: textTheme.bodySmall?.copyWith(fontSize: 10),
                          ),
                        )
                      ],
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MessagesPage(
                          user: users[index],
                        ),
                      ),
                    ),
                  ),
                  const Divider(height: 0.01),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
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
