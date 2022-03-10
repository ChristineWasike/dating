import 'package:equatable/equatable.dart';

import 'models.dart';

class UserMatch extends Equatable {
  final int id;
  final int userId;
  final User matchedUser;

  const UserMatch({
    required this.id,
    required this.userId,
    required this.matchedUser,
  });

  @override
  List<Object?> get props => [id, userId, matchedUser];

  static List<UserMatch> matches = [
    UserMatch(
      id: 1,
      userId: 1,
      matchedUser: User.users[1],
    ),
    UserMatch(
      id: 2,
      userId: 1,
      matchedUser: User.users[2],
    ),
    UserMatch(
      id: 3,
      userId: 1,
      matchedUser: User.users[3],
    ),
    UserMatch(
      id: 4,
      userId: 1,
      matchedUser: User.users[4],
    ),
    UserMatch(
      id: 5,
      userId: 1,
      matchedUser: User.users[5],
    ),
    UserMatch(
      id: 6,
      userId: 1,
      matchedUser: User.users[6],
    ),
    UserMatch(
      id: 7,
      userId: 1,
      matchedUser: User.users[7],
    ),
    UserMatch(
      id: 8,
      userId: 1,
      matchedUser: User.users[8],
    ),
  ];
}
