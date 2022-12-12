import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database_mocks/firebase_database_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/screens/multi_play.dart';
import '../components/header_bar.dart';
import '../components/right_button.dart';
import '../components/setting_screenshot.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

// for the utf8.encode method

class room_screen extends StatefulWidget {
  const room_screen({
    super.key,
    required this.RoomId,
    required this.name,
    required this.avatar,
    // required this.email,
    required this.RankPoint,
  });
  final int RoomId;
  final String name;
  final String avatar;
  // final String email;
  final int RankPoint;
  @override
  State<room_screen> createState() => _room_screenState();
}

class _room_screenState extends State<room_screen> {
  final _auth = FirebaseAuth.instance;

  final _fireRoom = FirebaseFirestore.instance;
  // test
  var idRoom = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // LAY THONG TIN NGUOI CHOI 2
    final _auth = FirebaseAuth.instance;
    var users = FirebaseFirestore.instance
        .collection("Users")
        .where('uid', isEqualTo: _auth.currentUser!.email)
        .snapshots();
    //
    var collection = FirebaseFirestore.instance.collection('Rooms');
    return StreamBuilder(
      stream: collection.doc(widget.RoomId.toString()).snapshots(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return Center(child: CircularProgressIndicator());
        }
        Map<String, dynamic> room =
            snapshot.data!.data() as Map<String, dynamic>;
        if (room['star'] == 1) {
          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => multi_play(
                        chapter: 3,
                      )));
        }
        return Scaffold(
          backgroundColor: Color.fromARGB(0, 255, 193, 7),
          body: SingleChildScrollView(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1.7,
                              height: MediaQuery.of(context).size.height / 1.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Color.fromARGB(156, 242, 247, 244)
                                      .withOpacity(0.8),
                                  border: Border.all(width: 2)),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 10, 0, 15),
                                    height: MediaQuery.of(context).size.height /
                                        8.5,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          const Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('ID',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text('${room['id']}'),
                                            ),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.black),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  8, 8, 10, 5),
                                              child: TextField(
                                                controller: idRoom,
                                                decoration: InputDecoration(
                                                  hintText: 'ID',
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                  ),
                                                  prefixIcon:
                                                      Icon(Icons.search),
                                                ),
                                              ),
                                            ),
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              minimumSize: Size(20, 40),
                                            ),
                                            onPressed: () {
                                              String id = idRoom.text;
                                              debugPrint(id);
                                              debugPrint(room['id'].toString());
                                              if (id == room['id'].toString()) {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        AlertDialog(
                                                          backgroundColor:
                                                              Color.fromARGB(
                                                                  255,
                                                                  246,
                                                                  246,
                                                                  246),
                                                          content: Container(
                                                            height: 20,
                                                            width: 300.0,
                                                            child: Text(
                                                                'Bạn đang ở trong phòng rồi đó:))'),
                                                          ),
                                                        ));
                                              } else {
                                                FirebaseFirestore.instance
                                                    .collection('Rooms')
                                                    .doc(id)
                                                    .snapshots()
                                                    .forEach((element) {
                                                  if (element.data()!['player2']
                                                          ['email'] ==
                                                      _auth
                                                          .currentUser!.email) {
                                                    showDialog(
                                                        context: context,
                                                        // barrierDismissible: false,
                                                        builder:
                                                            (context) =>
                                                                AlertDialog(
                                                                  backgroundColor:
                                                                      Color.fromARGB(
                                                                          255,
                                                                          246,
                                                                          246,
                                                                          246),
                                                                  content:
                                                                      Container(
                                                                    height: 20,
                                                                    width:
                                                                        300.0,
                                                                    child: Text(
                                                                        'Phòng đã đủ người:))'),
                                                                  ),
                                                                ));
                                                  } else {
                                                    Navigator.pop(context);
                                                    _fireRoom
                                                        .collection("Rooms")
                                                        .doc(id)
                                                        .update({
                                                      'create_at':
                                                          DateTime.now(),
                                                      'player2.Avatar': widget
                                                          .avatar
                                                          .toString(),
                                                      'player2.DisplayName':
                                                          widget.name
                                                              .toString(),
                                                      'player2.email': _auth
                                                          .currentUser!.email,
                                                      'player2.RankPoint':
                                                          widget.RankPoint,
                                                      'player2.Point': 0,
                                                    });
                                                    _fireRoom
                                                        .collection("Rooms")
                                                        .doc(widget.RoomId
                                                            .toString())
                                                        .delete();

                                                    showDialog(
                                                        context: context,
                                                        barrierDismissible:
                                                            false,
                                                        builder: (context) =>
                                                            AlertDialog(
                                                              backgroundColor:
                                                                  Color
                                                                      .fromARGB(
                                                                          0,
                                                                          246,
                                                                          246,
                                                                          246),
                                                              content:
                                                                  Container(
                                                                height: 280,
                                                                width: 580.0,
                                                                child:
                                                                    room_screen(
                                                                  RoomId:
                                                                      int.parse(
                                                                          id),
                                                                  name: widget
                                                                      .name,
                                                                  avatar: widget
                                                                      .avatar,
                                                                  RankPoint: widget
                                                                      .RankPoint,
                                                                ),
                                                              ),
                                                            ));
                                                  }
                                                });
                                              }
                                            },
                                            child: Text(
                                              'Ok',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              if (room['player1']['email'] !=
                                                      '' &&
                                                  room['player2']['email'] ==
                                                      '') {
                                                _fireRoom
                                                    .collection("Rooms")
                                                    .doc(widget.RoomId
                                                        .toString())
                                                    .delete();
                                              }
                                              if (room['player1']['email'] ==
                                                  _auth.currentUser!.email) {
                                                _fireRoom
                                                    .collection("Rooms")
                                                    .doc(widget.RoomId
                                                        .toString())
                                                    .update({
                                                  'create_at': DateTime.now(),
                                                  'player1.Avatar':
                                                      room['player2']['Avatar'],
                                                  'player1.DisplayName':
                                                      room['player2']
                                                          ['DisplayName'],
                                                  'player1.email':
                                                      room['player2']['email'],
                                                  'player1.RankPoint':
                                                      room['player2']
                                                          ['RankPoint'],
                                                  'player2.Avatar': null,
                                                  'player2.DisplayName': null,
                                                  'player2.email': '',
                                                  'player2.RankPoint': 0,
                                                  'player2.Point': 0,
                                                });
                                              }
                                              if (room['player2']['email'] ==
                                                  _auth.currentUser!.email) {
                                                _fireRoom
                                                    .collection("Rooms")
                                                    .doc(widget.RoomId
                                                        .toString())
                                                    .update({
                                                  'create_at': DateTime.now(),
                                                  'player2.Avatar': null,
                                                  'player2.DisplayName': null,
                                                  'player2.email': '',
                                                  'player2.RankPoint': 0,
                                                  'player2.Point': 0,
                                                });
                                              }
                                            },
                                            icon: Image.asset(
                                                'assets/icons/exit.png'),
                                          )
                                        ]),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                30, 2, 0, 10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  width: 0.5,
                                                  color: Colors.black),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                          255, 12, 12, 12)
                                                      .withOpacity(0.5),

                                                  blurRadius: 7,
                                                  offset: Offset(0,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: User(user: room['player1']),
                                          ),
                                        ),
                                        Expanded(
                                          child: Image.asset(
                                            "assets/icons/vs.png",
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                30, 2, 0, 10),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.black),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color.fromARGB(
                                                            255, 12, 12, 12)
                                                        .withOpacity(0.5),

                                                    blurRadius: 7,
                                                    offset: Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)),
                                            child: room['player2']['email'] ==
                                                    ''
                                                ? Image.asset(
                                                    'assets/Loading_2.gif')
                                                : User(user: room['player2']),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (room['player1']['email'] ==
                                              _auth.currentUser!.email &&
                                          room['player2']['email'] != '') {
                                        _fireRoom
                                            .collection("Rooms")
                                            .doc(widget.RoomId.toString())
                                            .update({
                                          'create_at': DateTime.now(),
                                          'star': 1,
                                        });
                                        Navigator.pop(context);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    multi_play(
                                                      chapter: 3,
                                                    )));
                                      }
                                    },
                                    child: room['player1']['email'] ==
                                                _auth.currentUser!.email &&
                                            room['player2']['email'] != ''
                                        ? Text(
                                            'Bắt đầu',
                                            style: TextStyle(fontSize: 15),
                                          )
                                        : Text(
                                            'Đợi đối thủ bắt đầu',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.amber),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ),
        );
      },
    );
  }
}

String CheckRank(int p) {
  if (p <= 0)
    return "Không";
  else if (p <= 50)
    return "Bạc";
  else if (p <= 100)
    return "Vàng";
  else if (p <= 150) return "Bạch Kim";
  return "kim cương";
}

int checkRooms(String rooms) {
  var room = FirebaseFirestore.instance.collection('Rooms');
  var resulf = "ok";
  FutureBuilder<DocumentSnapshot>(
    future: room.doc(rooms).get(),
    builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      if (snapshot.hasError) {
        resulf = "no";
      }
      if (snapshot.hasData && !snapshot.data!.exists) {
        resulf = "no";
      }
      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        if (data['layer2']['email'] != null) {
          resulf = "no";
        }
      }
      return Text('');
    },
  );
  if (resulf == "ok") return 1;
  return -1;
}

class User extends StatelessWidget {
  final user;
  User({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    var p = user['RankPoint'];
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 15,
                  offset: Offset(-5, 5),
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/img/${user['Avatar']}'),
            ),
          ),
        ),
        Text(
          '${user['DisplayName']}',
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: Text('ID:${user['email']}'),
        ),
        Text('Rank: ' + CheckRank(p)),
      ],
    );
  }
}
