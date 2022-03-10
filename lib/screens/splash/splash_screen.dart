import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/logo.png',
              height: 100,
            ),
            const SizedBox(height: 20),
            Text(
              'ARROW',
              style: Theme.of(context).textTheme.headline1,
            )
          ],
        ),
      ),
    );
  }
}
