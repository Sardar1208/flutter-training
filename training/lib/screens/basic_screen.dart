import 'package:flutter/material.dart';

class BasicScreen extends StatelessWidget {
  const BasicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New page"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("This is a new page via Navigator.push."),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Previous page"),
            )
          ],
        ),
      ),
    );
  }
}
