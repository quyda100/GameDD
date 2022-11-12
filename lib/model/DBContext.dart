import 'user.dart';
import 'room.dart';

class DBContext {
  static List<User> getUser() {
    List<User> users = [
      User(id: 1, username: "Admin", coin: 1000, heart: 5, rank: "Kim cương"),
      User(id: 2, username: "Vuong11", coin: 1000, heart: 5, rank: "Vàng"),
      User(id: 3, username: "Phuoc22", coin: 1000, heart: 5, rank: "Bạc")
    ];
    return users;
  }
}
