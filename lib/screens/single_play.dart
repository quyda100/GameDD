import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../components/header_bar.dart';

class SinglePlay extends StatefulWidget {
  const SinglePlay({super.key});

  @override
  State<SinglePlay> createState() => _SinglePlayState();
}

class _SinglePlayState extends State<SinglePlay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg.gif"), fit: BoxFit.cover)),

      // image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
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
                    width: MediaQuery.of(context).size.width / 2,
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(width: 0, color: Colors.black),
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 178, 177, 169)
                                .withOpacity(0.5),
                            blurRadius: 8,
                            offset: Offset(0, 8),
                          ),
                        ]),
                    child: const Text(
                      "Câu 1: Tam giác là gì? ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      softWrap: true,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Answer(),
                  const Padding(
                      padding: EdgeInsets.only(top: 1), child: Answer()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.all(8.0),
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
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
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
