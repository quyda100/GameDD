import 'item.dart';

class User {
  String? username;
  int? coin;
  int? heart;
  int? rank;
  String? avatar;
  Bag? bag;
  User(
      {required this.username,
      this.coin = 1000,
      this.heart = 5,
      this.rank = 0,
      this.avatar = "Default.png",
      this.bag});
  User.fromJson(Map<String, dynamic> json) {
    username = json['DisplayName'];
    avatar = json['Avatar'];
    heart = json['Heart'];
    rank = json['RankPoint'];
    bag = json['Bag'] != null ? new Bag.fromJson(json['Bag']) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DisplayName'] = username;
    data['Avatar'] = avatar;
    data['Heart'] = heart;
    data['RankPoint'] = rank;
    if (bag != null) {
      data['Bag'] = bag!.toJson();
    }
    return data;
  }
}

class Bag {
  int? i50;
  int? heart;
  int? double;
  int? skip;

  Bag({this.i50, this.heart, this.double, this.skip});

  Bag.fromJson(Map<String, dynamic> json) {
    i50 = json['50'];
    heart = json['heart'];
    double = json['double'];
    skip = json['skip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['50'] = i50;
    data['heart'] = heart;
    data['double'] = double;
    data['skip'] = skip;
    return data;
  }
}
