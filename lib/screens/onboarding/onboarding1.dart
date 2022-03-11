import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:dating/screens/onboarding/onboarding3.dart';

import '../../main.dart';

class Passions extends StatefulWidget {
  const Passions({Key? key}) : super(key: key);

  @override
  State<Passions> createState() => _PassionsState();
}

class _PassionsState extends State<Passions> {
  List<String> tags = [];
  List<String> options = [
    'Cycling',
    'Trivia',
    'Astrology',
    'Golf',
    'Wine',
    'Art',
    'Astrology',
    'Baking',
    'Yoga',
    'DIY',
    'Comedy',
    'Gaming',
    'Dancing',
    'Sports',
    'Netflix',
    'Reading',
    'Karaoke',
    'Brunch',
    'Cat Lover',
    'Dog Lover',
    'Coffee',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            const Text(
              "Passions",
              style: TextStyle(fontSize: 24.0),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Get recommended activities based on your passions.",
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(
              height: 20,
            ),
            ChipsChoice<String>.multiple(
              value: tags,
              onChanged: (val) => setState(() => tags = val),
              choiceItems: C2Choice.listFrom<String, String>(
                  source: options, value: (i, v) => v, label: (i, v) => v),
              choiceStyle: const C2ChoiceStyle(
                color: Colors.black,
              ),
              wrapped: true,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Values()));
              },
              child: const Text("Continue"),
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
