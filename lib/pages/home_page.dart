import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:messageapp/controllers/message_controller.dart';
import 'package:messageapp/controllers/user_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = UserController();
    String m = '';
    return Scaffold(
      body: FutureBuilder(
        future: http.get(userController.getUsers()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            userController.convertJsonUsers(snapshot.data!.body);
            final users = userController.allUsers();
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  trailing: CircleAvatar(
                    child: FadeInImage.assetNetwork(
                      placeholder: users[index].placeHolder,
                      image: (users[index].photoUrl ?? ''),
                    ),
                  ),
                  title: Text(users[index].name),
                );
              },
            );
          } else {
            m = 'falhou';
          }
          return Text(m);
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
