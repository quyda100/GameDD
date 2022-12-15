// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/chapter.dart';
import 'package:flutter_application_1/model/subject.dart';
import 'package:flutter_application_1/model/user.dart';
import 'package:flutter_application_1/pop_up/highscore.dart';
import 'package:flutter_application_1/screens/single_play.dart';

class VuotAi extends StatefulWidget {
  VuotAi({super.key, required this.chapter, required this.player});
  int chapter;
  Player player;
  @override
  State<VuotAi> createState() => _VuotAiState();
}

class _VuotAiState extends State<VuotAi> {
  Chapter chap = Chapter(id: 1, title: "Khởi đầu", point: 4000);
  final _fireStore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    _fireStore
        .collection("Chapters")
        .doc(widget.chapter.toString())
        .snapshots()
        .forEach(
      (element) {
        chap = Chapter.fromDocumentSnapshot(element);
      },
    );
    return StreamBuilder(
        stream: _fireStore.collection("Subjects").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<Subject> subject = snapshot.data!.docs
              .map((e) => Subject.fromDocumentSnapshot(e))
              .toList();
          return Scaffold(
            backgroundColor: const Color.fromARGB(0, 255, 193, 7),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                          width: MediaQuery.of(context).size.width / 1.7,
                          height: MediaQuery.of(context).size.height / 1.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: const Color.fromARGB(255, 100, 184, 224)
                                  .withOpacity(0.8),
                              border: Border.all(width: 2)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Container(
                                    margin: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15),
                                        border: Border.all(width: 0),
                                        color: Colors.white.withOpacity(0.3)),
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: subject.length,
                                        itemBuilder: (context, index) {
                                          return Ai(
                                            sub: subject[index],
                                            ChapterId: chap.id,
                                            player: widget.player,
                                          );
                                        })),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Align(
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Image.asset(
                                          'assets/icons/exit.png'),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 0, 8, 8),
                                      child: Column(
                                        children: [
                                          ElevatedButton(
                                            style: ButtonStyle(
                                              minimumSize:
                                                  MaterialStateProperty.all(
                                                      const Size(120, 35)),
                                              shape:
                                                  MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                              widget.chapter =
                                                  ++widget.chapter > 3
                                                      ? 1
                                                      : widget.chapter;
                                              showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertDialog(
                                                        backgroundColor:
                                                            const Color.fromARGB(
                                                                0,
                                                                246,
                                                                246,
                                                                246),
                                                        content: SizedBox(
                                                          height: 280,
                                                          width: 700.0,
                                                          // ignore: unnecessary_new
                                                          child: VuotAi(
                                                            chapter: widget
                                                                .chapter,
                                                            player:
                                                                widget.player,
                                                          ),
                                                        ),
                                                      ));
                                            },
                                            child: const Text("Chương kế"),
                                          ),
                                          ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.orange),
                                                minimumSize:
                                                    MaterialStateProperty.all(
                                                        const Size(120, 35)),
                                                shape:
                                                    MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18.0),
                                                  ),
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                                widget.chapter =
                                                    --widget.chapter < 1
                                                        ? 3
                                                        : widget.chapter;
                                                showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        AlertDialog(
                                                          backgroundColor:
                                                              const Color.fromARGB(
                                                                  0,
                                                                  246,
                                                                  246,
                                                                  246),
                                                          content: SizedBox(
                                                            height: 280,
                                                            width: 700.0,
                                                            // ignore: unnecessary_new
                                                            child: VuotAi(
                                                              chapter: widget
                                                                  .chapter,
                                                              player: widget
                                                                  .player,
                                                            ),
                                                          ),
                                                        ));
                                              },
                                              child:
                                                  const Text("Chương trước"))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Chương ${chap.id}:",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontStyle: FontStyle.italic),
                                        ),
                                        Text(chap.title,
                                            style: const TextStyle(
                                                fontSize: 19,
                                                color:
                                                    Colors.lightGreenAccent,
                                                fontWeight: FontWeight.bold)),
                                        Row(
                                          children: [
                                            Text("${6}/${chap.point ~/ 200}",
                                                style: const TextStyle(
                                                    fontSize: 19,
                                                    color: Colors
                                                        .lightGreenAccent,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            const Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ))
                                ],
                              )
                            ],
                          )),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}

class Ai extends StatelessWidget {
  Ai(
      {Key? key,
      required this.sub,
      required this.ChapterId,
      required this.player})
      : super(key: key);
  final Subject sub;
  final int ChapterId;
  Player player;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => SinglePlay(
                      subjectId: sub.id,
                      chapterId: ChapterId,
                      player: player,
                    )),
            (route) => false);
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
        margin: const EdgeInsets.fromLTRB(0, 10, 15, 0),
        decoration: BoxDecoration(
            border: Border.all(width: 0),
            borderRadius: BorderRadius.circular(18.0),
            color: Colors.white),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset("assets/subjects/${sub.image}"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/icons/menu.png')),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/icons/donghocat.png')),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  backgroundColor:
                                      const Color.fromARGB(0, 246, 246, 246),
                                  content: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1.2,
                                    child: const ingame_screen(),
                                  ),
                                ));
                      },
                      icon: Image.asset('assets/icons/lich.png')),
                ],
              ),
            ),
            Row(
              children: const [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
