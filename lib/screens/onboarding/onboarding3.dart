import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:dating/screens/onboarding/onboarding4.dart';

class Values extends StatefulWidget {
  const Values({Key? key}) : super(key: key);

  @override
  State<Values> createState() => _ValuesState();
}

class _ValuesState extends State<Values> {
  List<String> tags = [];
  List<String> options = [
    'Religious',
    'Atheist',
    'Conservative',
    'Liberal',
    'Agnostic',
    'Honesty',
    'Hardworker',
    'Generous',
    'Considerate'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Text(
              "Values and Beliefs",
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "What are your desired values and beliefs.",
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(
              height: 20,
            ),
            ChipsChoice<String>.multiple(
              value: tags,
              onChanged: (val) => setState(() => tags = val),
              choiceItems: C2Choice.listFrom<String, String>(
                  source: options, value: (i, v) => v, label: (i, v) => v),
              choiceStyle: C2ChoiceStyle(
                color: Colors.black,
              ),
              wrapped: true,
            ),
            SizedBox(
              height: 200,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Personality()));
              },
              child: Text("Continue"),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xff000000))),
            ),
          ],
        ),
      ),
    );
  }
}
