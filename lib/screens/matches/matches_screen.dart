import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../widgets/widgets.dart';

class MatchesScreen extends StatelessWidget {
  static const String routeName = '/matches';

  const MatchesScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const MatchesScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final inactiveMatches =
        UserMatch.matches.where((match) => match.userId == 1).toList();
    final activeMatches =
        UserMatch.matches.where((match) => match.userId == 1).toList();

    return Scaffold(
      appBar: const CustomAppBar(title: 'MATCHES'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Your Likes', style: Theme.of(context).textTheme.headline4),
              SizedBox(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: inactiveMatches.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          UserImageSmall(
                            height: 70,
                            width: 70,
                            url:
                                inactiveMatches[index].matchedUser.imageUrls[0],
                          ),
                          Text(
                            inactiveMatches[index].matchedUser.name,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ],
                      );
                    }),
              ),
              const SizedBox(height: 10),
              Text(
                'Your Chats',
                style: Theme.of(context).textTheme.headline4,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: activeMatches.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/chat',
                            arguments: activeMatches[index]);
                      },
                      child: Row(
                        children: [
                          UserImageSmall(
                            height: 70,
                            width: 70,
                            url: activeMatches[index].matchedUser.imageUrls[0],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                activeMatches[index].matchedUser.name,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                activeMatches[index].matchedUser.name,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                activeMatches[index].matchedUser.name,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
