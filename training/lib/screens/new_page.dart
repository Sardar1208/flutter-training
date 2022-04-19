import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: const Text("New page"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("This is a new page."),
            Text('Arguments are : ${args['arg1']} and ${args['arg2']}'),
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
