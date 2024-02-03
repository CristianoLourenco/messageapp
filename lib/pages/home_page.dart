import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.message),
                label: const Text("message"),
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.maxFinite, double.maxFinite),
                  shape: const RoundedRectangleBorder(),
                ),
              ),
            ),
            Expanded(
              child: FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.message),
                label: const Text("message"),
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.maxFinite, double.maxFinite),
                  shape: const RoundedRectangleBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
