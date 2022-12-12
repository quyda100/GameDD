import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pop_up/room.dart';
import 'package:flutter_application_1/screens/single_play.dart';
import 'package:flutter_application_1/screens/vuot_ai.dart';
import '../components/setting_screenshot.dart';
import '../components/right_button.dart';
import '../components/header_bar.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

final _fireRoom = FirebaseFirestore.instance;

class home extends StatefulWidget {
  const home({
    Key? key,
  }) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  // void createRoom(Map<String, dynamic> data) async {

  @override
  Widget build(BuildContext context) {
    // bien user dang nhap
    final _auth = FirebaseAuth.instance;
    var users = FirebaseFirestore.instance
        .collection("Users")
        .where('uid', isEqualTo: _auth.currentUser!.email)
        .snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: users,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final user = snapshot.data!.docs;
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/bg.gif"), fit: BoxFit.cover)),
            padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header_bar(),
                Row(
                  children: [
                    setting_screenshot(),
                    Expanded(
                        child: Container(
                      margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WidgetAnimator(
                            incomingEffect: WidgetTransitionEffects
                                .incomingSlideInFromLeft(),
                            atRestEffect: WidgetRestingEffects.fidget(),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 5,
                              height: MediaQuery.of(context).size.width / 3,
                              child: IconButton(
                                icon: Image.asset(
                                  "assets/img/choithu.png",
                                  scale: 2,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SinglePlay(
                                                chapterId: 1,
                                                subjectId: 1,
                                              )));
                                },
                              ),
                            ),
                          ),
                          WidgetAnimator(
                            incomingEffect: WidgetTransitionEffects
                                .incomingSlideInFromRight(),
                            atRestEffect: WidgetRestingEffects.fidget(),
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              width: MediaQuery.of(context).size.width / 5,
                              height: MediaQuery.of(context).size.width / 3,
                              child: IconButton(
                                icon: Image.asset("assets/img/vuotai.png"),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            backgroundColor: Color.fromARGB(
                                                0, 246, 246, 246),
                                            content: Container(
                                              height: 280,
                                              width: 700.0,
                                              child: new VuotAi(
                                                chapter: 1,
                                              ),
                                            ),
                                          ));
                                },
                              ),
                            ),
                          ),
                          WidgetAnimator(
                            incomingEffect: WidgetTransitionEffects
                                .incomingSlideInFromBottom(),
                            atRestEffect: WidgetRestingEffects.fidget(),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 4.5,
                              height: MediaQuery.of(context).size.width / 3,
                              child: IconButton(
                                icon: Image.asset("assets/img/xephang.png"),
                                onPressed: () {
                                  int roomId = Random().nextInt(9999);

                                  FirebaseFirestore.instance
                                      .collection("Rooms")
                                      .doc('${roomId}')
                                      .get()
                                      .then(
                                          (DocumentSnapshot documentSnapshot) {
                                    if (documentSnapshot.exists) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    } else {
                                      _fireRoom
                                          .collection("Rooms")
                                          .doc('${roomId}')
                                          .set({
                                        'id': roomId,
                                        'star': 0,
                                        'create_at': DateTime.now(),
                                        'player1': {
                                          'Avatar': user[0]['Avatar'],
                                          'DisplayName': user[0]['DisplayName'],
                                          'email': _auth.currentUser!.email,
                                          'RankPoint': user[0]['RankPoint'],
                                          'Point': 0,
                                        },
                                        'player2': {
                                          'Avatar': null,
                                          'DisplayName': null,
                                          'email': '',
                                          'RankPoint': 0,
                                          'Point': 0,
                                        }
                                      });
                                      Future.delayed(Duration(milliseconds: 1),
                                          () {
                                        showDialog(
                                            context: context,
                                            // barrierDismissible: false,

                                            builder: (context) => AlertDialog(
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          0, 246, 246, 246),
                                                  content: Container(
                                                    height: 280,
                                                    width: 580.0,
                                                    child: room_screen(
                                                      RoomId: roomId,
                                                      name: user[0]
                                                          ['DisplayName'],
                                                      avatar: user[0]['Avatar'],
                                                      RankPoint: user[0]
                                                          ['RankPoint'],
                                                    ),
                                                  ),
                                                ));
                                      });
                                    }
                                    return Center(
                                        child: CircularProgressIndicator());
                                  });

                                  // createRoom(data);
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ))
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
