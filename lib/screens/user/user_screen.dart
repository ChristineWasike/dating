// ignore_for_file: avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dating/blocs/swipe/swipe_bloc.dart';
import 'package:dating/models/models.dart';
import 'package:dating/widgets/widgets.dart';

class UsersScreen extends StatelessWidget {
  static const String routeName = '/users';

  static Route route({required User user}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => UsersScreen(user: user),
    );
  }

  final User user;

  const UsersScreen({
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          )),
      extendBodyBehindAppBar: true,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.9,
                child: Stack(
                  children: [
                    Hero(
                      tag: 'user_card',
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 45.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 2,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(user.imageUrls[0]),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 60,
                        ),
                        child: BlocBuilder<SwipeBloc, SwipeState>(
                          builder: (context, state) {
                            if (state is SwipeLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (state is SwipeLoaded) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      context.read<SwipeBloc>().add(
                                          SwipeRightEvent(
                                              user: state.users[0]));
                                      Navigator.pop(context);
                                      print('Swiped Right');
                                    },
                                    child: ChoiceButton(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      icon: Icons.clear_rounded,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      context.read<SwipeBloc>().add(
                                          SwipeRightEvent(
                                              user: state.users[0]));
                                      Navigator.pop(context);
                                      print('Swiped Left');
                                    },
                                    child: const ChoiceButton(
                                      width: 60,
                                      height: 60,
                                      size: 25,
                                      color: Colors.white,
                                      hasGradient: true,
                                      icon: Icons.favorite,
                                    ),
                                  ),
                                  ChoiceButton(
                                    color: Theme.of(context).primaryColor,
                                    icon: Icons.bookmark,
                                  ),
                                ],
                              );
                            } else {
                              return const Text('Something went wrong.');
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${user.name}, ${user.age}',
                        style: Theme.of(context).textTheme.headline2),
                    Text(
                      user.jobTitle,
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(height: 15),
                    Text('About', style: Theme.of(context).textTheme.headline3),
                    Text(user.bio,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(height: 2)),
                    const SizedBox(height: 15),
                    Text('Interests',
                        style: Theme.of(context).textTheme.headline3),
                    Row(
                      children: user.interests
                          .map((interest) => Container(
                                padding: const EdgeInsets.all(8.0),
                                margin:
                                    const EdgeInsets.only(top: 5.0, right: 5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  // gradient: LinearGradient(
                                  //   colors: [
                                  //     Theme.of(context).primaryColor,
                                  //     Theme.of(context).colorScheme.secondary,
                                  //   ],
                                  // ),
                                ),
                                child: Text(
                                  interest,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(color: Colors.white),
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
