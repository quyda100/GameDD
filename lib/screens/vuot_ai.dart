import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/highscore.dart';
import 'package:flutter_application_1/screens/single_play.dart';
import '../components/setting_screenshot.dart';
import '../components/right_button.dart';
import '../components/header_bar.dart';
import 'home.dart';

class VuotAi extends StatefulWidget {
  const VuotAi({super.key});

  @override
  State<VuotAi> createState() => _VuotAiState();
}

class _VuotAiState extends State<VuotAi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
        padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header_bar(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const setting_screenshot(),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 30, right: 30),
                      width: MediaQuery.of(context).size.width / 1.7,
                      height: MediaQuery.of(context).size.height / 1.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Color.fromARGB(255, 100, 184, 224)
                              .withOpacity(0.8),
                          border: Border.all(width: 2)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(width: 0),
                                  color: Colors.white.withOpacity(0.3)),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Ai(),
                                    Ai(),
                                    Ai(),
                                    Ai(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Align(
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => home()));
                                  },
                                  icon: Image.asset('assets/icons/exit.png'),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 8, 8),
                                  child: Column(
                                    children: [
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          minimumSize:
                                              MaterialStateProperty.all(
                                                  Size(120, 35)),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: const Text("Chương kế"),
                                      ),
                                      ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.orange),
                                            minimumSize:
                                                MaterialStateProperty.all(
                                                    Size(120, 35)),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: const Text("Chương trước"))
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Chương ${1}:",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    const Text("Khởi hành",
                                        style: TextStyle(
                                            fontSize: 19,
                                            color: Colors.lightGreenAccent,
                                            fontWeight: FontWeight.bold)),
                                    Row(
                                      children: const [
                                        Text("${6}/${20}",
                                            style: TextStyle(
                                                fontSize: 19,
                                                color: Colors.lightGreenAccent,
                                                fontWeight: FontWeight.bold)),
                                        Icon(
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
      ),
    );
  }
}

class Ai extends StatelessWidget {
  const Ai({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => SinglePlay()),
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
                Image.asset("assets/icons/vong.png"),
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
                      onPressed: () {},
                      icon: Image.asset('assets/icons/lich.png')),
                ],
              ),
            ),
            Row(
              children: [
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
