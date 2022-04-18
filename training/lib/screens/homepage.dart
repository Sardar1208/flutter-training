import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forms'),
      ),
      body: FormPage(
        key: key,
      ),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formkey = GlobalKey<FormState>();

  bool termsCheck = false;
  String sex = "Male";
  String selectedPosition = "SDE";
  var positions = <String>[
    'SDE',
    "Designer",
    "Content Writer",
    "Project Manager",
    "HR"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Flexible(
                  child: FormInput(
                    label: 'First Name',
                  ),
                ),
                Flexible(
                  child: FormInput(
                    label: 'Last Name',
                  ),
                ),
              ],
            ),
            const FormInput(
              label: 'Mobile Number',
            ),
            const FormInput(
              label: 'Email',
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text("Select your position : "),
                ),
                DropdownButton(
                    value: selectedPosition,
                    items: positions
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        if (val != null) {
                          selectedPosition = val.toString();
                        }
                      });
                    }),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: "Male",
                  groupValue: sex,
                  onChanged: (val) {
                    setState(() {
                      sex = "Male";
                    });
                  },
                ),
                const Text("Male"),
                Radio(
                  value: "Female",
                  groupValue: sex,
                  onChanged: (val) {
                    setState(() {
                      sex = "Female";
                    });
                  },
                ),
                const Text("Female"),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: termsCheck,
                  onChanged: (val) {
                    setState(() {
                      termsCheck = !termsCheck;
                    });
                  },
                ),
                const Text("I agree to the terms and conditions")
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}

class FormInput extends StatelessWidget {
  const FormInput({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          label: Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "This fild is required";
          }
          return null;
        },
      ),
    );
  }
}
