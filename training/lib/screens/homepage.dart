import 'package:flutter/material.dart';
import 'package:training/data/address.dart';
import 'package:training/data/student.dart';
import 'package:training/student_services.dart';
import 'package:training/address_services.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Student st;
  late Address ad;

  @override
  void initState() {
    super.initState();
    callAPI();
  }

  void callAPI() async {
    var student = await loadStudent();
    var address = await loadAddress();

    setState(() {
      st = student;
      ad = address;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JSON parsing"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('name: ${st.studentName}'),
            Text('score: ${st.studentScores}'),
            Text('address: ${ad.city}  ${ad.streets}'),
          ],
        ),
      ),
    );
  }
}
