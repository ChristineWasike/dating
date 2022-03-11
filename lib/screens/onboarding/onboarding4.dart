import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:dating/main.dart';

class Personality extends StatefulWidget {
  const Personality({Key? key}) : super(key: key);

  @override
  State<Personality> createState() => _PersonalityState();
}

class _PersonalityState extends State<Personality> {
  List<String> tags = [];
  List<String> options = [
    'Introvert',
    'Extrovert',
    'Charismatic',
    'Funny',
    'Joyful',
    'Sombre',
    'Conscientious',
    'Agreeable',
    'Strict',
    'Discerning',
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
              "Personality Traits",
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Your personality.",
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
                        builder: (context) => const MyHomePage()));
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
