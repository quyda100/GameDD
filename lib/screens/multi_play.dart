import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/question.dart';
import '../components/header_bar.dart';

class multi_play extends StatefulWidget {
  multi_play({super.key, required int chapter});
  @override
  State<multi_play> createState() => _multi_playState();
}

class _multi_playState extends State<multi_play> {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  bool isLock = false;
  int index = 0;
  int point = 0;
  void nextQuest(int p, bool value) {
    if (isLock == true) {
      return;
    } else if (index == 7) {
      point += value ? p : 0;
      setState(() {
        isLock = true;
      });
      Future.delayed(Duration(seconds: 1), () {
        Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
      });
    } else {
      point += value ? p : 0;
      isLock = true;
      setState(() {});
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          index++;
          isLock = false;
        });
      });
      //
    }
  }

  @override
  Widget build(BuildContext context) {
    var snapshots = _fireStore
        .collection("Questions")
        .where("Subject.Id", isEqualTo: 1)
        .where("Chapter.Id", isEqualTo: 1)
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
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width / 2,
                              height: MediaQuery.of(context).size.height / 7,
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                              margin: const EdgeInsets.only(bottom: 8),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  border:
                                      Border.all(width: 0, color: Colors.black),
                                  borderRadius: BorderRadius.circular(18),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromARGB(
                                              255, 178, 177, 169)
                                          .withOpacity(0.5),
                                      blurRadius: 8,
                                      offset: const Offset(0, 8),
                                    ),
                                  ]),
                              child: Text(
                                questions[index].title,
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
                                    GestureDetector(
                                      onTap: () => nextQuest(
                                          questions[index].point,
                                          0 == questions[index].key),
                                      child: AnswerWidget(
                                        answer: questions[index].answers[0],
                                        isKey: 0 == questions[index].key,
                                        isLock: isLock,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => nextQuest(
                                          questions[index].point,
                                          1 == questions[index].key),
                                      child: AnswerWidget(
                                        answer: questions[index].answers[1],
                                        isKey: 1 == questions[index].key,
                                        isLock: isLock,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () => nextQuest(
                                          questions[index].point,
                                          2 == questions[index].key),
                                      child: AnswerWidget(
                                        answer: questions[index].answers[2],
                                        isKey: 2 == questions[index].key,
                                        isLock: isLock,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => nextQuest(
                                          questions[index].point,
                                          3 == questions[index].key),
                                      child: AnswerWidget(
                                        answer: questions[index].answers[3],
                                        isKey: 3 == questions[index].key,
                                        isLock: isLock,
                                      ),
                                    ),
                                  ],
                                )
                              ],
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
                                              'assets/icons/50.png')),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: Image.asset(
                                              'assets/icons/exit.png')),
                                    ],
                                  ),
                                ),
                                Text(
                                  "Câu: ${(index + 1)} / 8",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 8, 20, 0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 2),
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          25, 7, 15, 15),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "assets/img/Default.png"),
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Image.asset(
                                                  'assets/icons/heart.png')),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Image.asset(
                                                  'assets/icons/50.png')),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Image.asset(
                                                  'assets/icons/100.png')),
                                        ],
                                      ),
                                    ),
                                  ),
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

class AnswerWidget extends StatefulWidget {
  String answer;
  bool isKey;
  bool isLock;
  AnswerWidget({
    required this.answer,
    required this.isKey,
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
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width / 4,
      height: MediaQuery.of(context).size.height / 8,
      margin: const EdgeInsets.fromLTRB(3, 8, 3, 0),
      decoration: BoxDecoration(
        color: widget.isLock
            ? widget.isKey
                ? Colors.green
                : Colors.red
            : Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Text(
        widget.answer,
        style: const TextStyle(fontSize: 18, color: Colors.black),
        textAlign: TextAlign.center,
      ),
    );
  }
}
