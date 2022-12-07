import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/screens/multi_play.dart';
import '../components/header_bar.dart';
import '../components/right_button.dart';
import '../components/setting_screenshot.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert'; // for the utf8.encode method

class room_screen extends StatefulWidget {
  const room_screen({super.key, required this.RoomId});
  final int RoomId;
  @override
  State<room_screen> createState() => _room_screenState();
}

class _room_screenState extends State<room_screen> {
  final _auth = FirebaseAuth.instance;
  final _fireRoom = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    var Rooms = FirebaseFirestore.instance
        .collection("Rooms")
        .where("Id", isEqualTo: widget.RoomId)
        .snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: Rooms,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final room = snapshot.data!.docs;
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
                                              child: Text('${room[0]['Id']}'),
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
                                            onPressed: () {},
                                            child: Text(
                                              'Ok',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              if (room[0]['player1']['email'] ==
                                                      _auth
                                                          .currentUser!.email &&
                                                  room[0]['player2']['email'] ==
                                                      '') {
                                                _fireRoom
                                                    .collection("Rooms")
                                                    .doc(widget.RoomId
                                                        .toString())
                                                    .delete();
                                              }
                                              Navigator.pop(context);
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
                                            child:
                                                User(user: room[0]['player1']),
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
                                            child:
                                                User(user: room[0]['player2']),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  multi_play()),
                                          (route) => false);
                                    },
                                    child: Text(
                                      'Bắt Đầu',
                                      style: TextStyle(fontSize: 15),
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
              backgroundImage: AssetImage(user['email'] != ''
                  ? 'assets/img/${user['Avatar']}'
                  : 'assets/Loading_2.gif'),
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
