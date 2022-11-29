import 'package:flutter/material.dart';
import '../components/header_bar.dart';
import '../components/right_button.dart';
import '../components/setting_screenshot.dart';

class multi_play extends StatefulWidget {
  const multi_play({super.key});

  @override
  State<multi_play> createState() => _multi_playState();
}

class _multi_playState extends State<multi_play> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg.gif"), fit: BoxFit.cover)),
      padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
      child: Column(children: [
        header_bar(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.deepPurple.shade300.withOpacity(0.8),
                  border: Border.all(width: 1)),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 178, 177, 169)
                                .withOpacity(0.5),
                            blurRadius: 8,
                            offset: Offset(0, 8),
                          ),
                        ]),
                    child: Text(
                      "Câu 1: Tam giác là gì? ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Answer(),
                  Padding(
                      padding: const EdgeInsets.only(top: 1), child: Answer()),
                ],
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.grey.shade300.withOpacity(0.6)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/icons/camera.png')),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/icons/heart.png')),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/icons/100.png')),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/icons/50.png'))
                ],
              ),
            ),
            Text(
              "Số câu: " + "1/" + "15",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 20, 0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 7, 15, 15),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/img/Default.png"),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/icons/heart.png')),
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/icons/50.png')),
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/icons/100.png')),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    ));
  }
}

class Answer extends StatelessWidget {
  const Answer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: Size(300, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {},
              child: Text(
                "I don't know",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                minimumSize: Size(300, 50),
              ),
              onPressed: () {},
              child: Text(
                "I don't know",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
