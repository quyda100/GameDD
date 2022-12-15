// ignore_for_file: camel_case_types, use_build_context_synchronously

import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pop_up/room.dart';
import 'package:flutter_application_1/screens/single_play.dart';
import 'package:flutter_application_1/screens/vuot_ai.dart';
import '../components/setting_screenshot.dart';
import '../components/header_bar.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import '../model/user.dart';

final _fireRoom = FirebaseFirestore.instance;

class home extends StatefulWidget {
  const home({
    Key? key,
  }) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  Player player = Player(email: '', username: '');
  final _auth = FirebaseAuth.instance;
  int roomId = Random().nextInt(9999);
  Future loadInfo() async {
    var snapshots = await FirebaseFirestore.instance
        .collection("Users")
        .where('uid', isEqualTo: _auth.currentUser!.email)
        .get();
    await Future.forEach(snapshots.docs, (element) {
      setState(() {
        player = Player.fromDocumentSnapshot(element);
      });
    });
  }

  Future createRoom() async {
    var snapshots = await FirebaseFirestore.instance
        .collection("Rooms")
        .doc('$roomId')
        .get();
    if (snapshots.exists) {
      ElegantNotification.error(
              width: MediaQuery.of(context).size.width / 4,
              title: const Text("Thông Báo"),
              description: const Text("Phòng Đã Tồn Tại"))
          .show(context);
      return;
    }
    _fireRoom.collection("Rooms").doc('$roomId').set({
      'id': roomId,
      'star': 0,
      'create_at': DateTime.now(),
      'player1': {
        'Avatar': player.avatar,
        'DisplayName': player.username,
        'email': player.email,
        'RankPoint': player.rank,
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
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          Future.delayed(const Duration(seconds: 1));
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/bg.gif"), fit: BoxFit.cover)),
              padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header_bar(
                    player: player,
                  ),
                  Row(
                    children: [
                      const setting_screenshot(),
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
                                                  player: player,
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
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      0, 246, 246, 246),
                                              content: SizedBox(
                                                height: 280,
                                                width: 700.0,
                                                child: VuotAi(
                                                  chapter: 1,
                                                  player: player,
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
                                    FutureBuilder(
                                      future: createRoom(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasError) {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }
                                        return AlertDialog(
                                          backgroundColor: const Color.fromARGB(
                                              0, 246, 246, 246),
                                          content: SizedBox(
                                            height: 280,
                                            width: 580.0,
                                            child: room_screen(
                                              roomId: roomId,
                                              player: player,
                                            ),
                                          ),
                                        );
                                      },
                                    );
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
        });
  }
}
