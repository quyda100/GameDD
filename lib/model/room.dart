import 'user.dart';

class Room {
  int id;
  Player? user1;
  Player? user2;
  Room({required this.id, this.user1, this.user2});
}
