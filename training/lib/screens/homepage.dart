import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:training/screens/new_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  Duration _elapsed = Duration.zero;
  late final Ticker _ticker;
  @override
  void initState() {
    // print(_elapsed.compareTo(Duration(seconds: 0)));
    super.initState();
    _ticker = createTicker((elapsed) {
      if (elapsed.compareTo(const Duration(seconds: 5)) > 0) {
        _ticker.stop();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const NewPage()));
      }
      setState(() {
        _elapsed = elapsed;
      });
    });
    _ticker.start();
  }

  @override
  void deactivate() {
    super.dispose();
    print("disposed");
    _ticker.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lifecycle Methods'),
      ),
      body: Center(
        child: Text(_elapsed.toString()),
      ),
    );
  }
}
