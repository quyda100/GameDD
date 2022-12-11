import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/question.dart';
import '../components/header_bar.dart';

var po = 0;

class SinglePlay extends StatefulWidget {
  SinglePlay({super.key, required this.chapterId, required this.subjectId});
  final int chapterId;
  final int subjectId;
  @override
  State<SinglePlay> createState() => _SinglePlayState();
}

class _SinglePlayState extends State<SinglePlay> {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  bool isLock = false;
  int index = 0;
  int point = 0;
  void nextQuest(int p) {
    po = p;
    if (index >= 8 || isLock == true) {
      return;
    } else {
      point += po;
      isLock = true;
      index == 7 ? null : index++;
      isLock = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var snapshots = _fireStore
        .collection("Questions")
        .where("Subject.Id", isEqualTo: widget.subjectId)
        .where("Chapter.Id", isEqualTo: widget.chapterId)
        .snapshots();
    return StreamBuilder(
        stream: snapshots,
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
          List<Question> questions = snapshot.data!.docs
              .map((e) => Question.fromDocumentSnapshot(e))
              .toList();
          return Scaffold(
              resizeToAvoidBottomInset: true,
              body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/bg.gif"), fit: BoxFit.cover),
                ),
                padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                child: Column(children: [
                  header_bar(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.3,
                        padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.blueAccent.withOpacity(0.3),
                            border: Border.all(width: 1)),
                        child: Column(
                          children: [
                            QuestionWidget(
                              question: questions[index],
                              next: () => nextQuest(questions[index].point),
                              islock: isLock,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: Colors.grey.shade300
                                          .withOpacity(0.6)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      IconButton(
                                          onPressed: () {},
                                          icon: Image.asset(
                                              'assets/icons/camera.png')),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Image.asset(
                                              'assets/icons/heart.png')),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Image.asset(
                                              'assets/icons/100.png')),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Image.asset(
                                              'assets/icons/50.png'))
                                    ],
                                  ),
                                ),
                                Text(
                                  "Câu: ${(index + 1)} / 8",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Điểm: ${(point)}",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ]),
              ));
        });
  }
}

class QuestionWidget extends StatelessWidget {
  int dex = 0;
  final VoidCallback next;
  bool islock;
  QuestionWidget({
    required this.question,
    required this.next,
    required this.islock,
    Key? key,
  }) : super(key: key);
  Question question;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 7,
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(width: 0, color: Colors.black),
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 178, 177, 169).withOpacity(0.5),
                blurRadius: 8,
                offset: const Offset(0, 8),
              ),
            ]),
        child: Text(
          question.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          softWrap: true,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnswerWidget(
                answer: question.answers[dex],
                isKey: dex++ == question.key,
                next: next,
                isLock: islock,
              ),
              AnswerWidget(
                answer: question.answers[dex],
                isKey: dex++ == question.key,
                next: next,
                isLock: islock,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnswerWidget(
                answer: question.answers[dex],
                isKey: dex++ == question.key,
                next: next,
                isLock: islock,
              ),
              AnswerWidget(
                answer: question.answers[dex],
                isKey: dex == question.key,
                next: next,
                isLock: islock,
              ),
            ],
          )
        ],
      ),
    ]);
  }
}

class AnswerWidget extends StatefulWidget {
  String answer;
  bool isKey;
  final VoidCallback next;
  bool isLock;
  AnswerWidget({
    required this.answer,
    required this.isKey,
    required this.next,
    required this.isLock,
    super.key,
  });

  @override
  State<AnswerWidget> createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      height: MediaQuery.of(context).size.height / 8,
      margin: const EdgeInsets.fromLTRB(3, 8, 3, 0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.isLock
              ? widget.isKey
                  ? Colors.green
                  : Colors.red
              : Colors.white,
          maximumSize: Size(MediaQuery.of(context).size.width / 4,
              MediaQuery.of(context).size.height / 6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: widget.isKey
            ? widget.next
            : () => setState(() {
                  widget.isLock = true;
                }),
        child: Text(
          widget.answer,
          style: const TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }
}
