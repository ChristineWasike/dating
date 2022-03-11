import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<String> tags = [];
  List<String> options = [
    'Cycling',
    'Trivia',
    'Astrology',
    'Golf',
    'Wine',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Image.asset(
              "assets/memoji5.png",
              width: 150,
              height: 150,
            ),
            Text(
              "Malaika Kariuki",
              style: TextStyle(fontSize: 24.0),
              textAlign: TextAlign.center,
            ),

            SizedBox(
              height: 20,
            ),

            Text(
              "I'm a wine enthusiast, I really love sporting activites such as cycling, golf and bowling, and I'm a trivia geek.",
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 20,),

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
          ],
        ),
      ),
    );
  }
}
