import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/history_screen.dart';
import 'package:flutter_application_1/screens/history_screen.dart';
import '../components/setting_screenshot.dart';
import '../components/right_button.dart';
import '../components/header_bar.dart';

class profile_screen extends StatefulWidget {
  const profile_screen({super.key});

  @override
  State<profile_screen> createState() => _profile_screenState();
}

class _profile_screenState extends State<profile_screen> {
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
            Header(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                setting_screenshot(),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 30, right: 20),
                    width: MediaQuery.of(context).size.width / 1.7,
                    height: MediaQuery.of(context).size.height / 1.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.deepPurple.shade300.withOpacity(0.8),
                        border: Border.all(width: 2)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Padding(
                                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/img/Default.png'),
                                )),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Tên: AdminABC",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "ID: 07079",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          "Rank: Vàng",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Image.asset('assets/icons/exit.png'),
                            )
                          ],
                        ),
                        Text(
                          "Xếp hạng",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/icons/medal.png',
                                  ),
                                  Text(
                                    "2" + "/100",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/icons/trophy.png',
                                  ),
                                  Text("2" + "/100",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Column(
                                children: const [
                                  Icon(
                                    Icons.diamond,
                                    size: 60,
                                    color: Colors.cyan,
                                  ),
                                  Text("2" + "/100",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton.icon(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white)),
                                  onPressed: () {},
                                  icon: Icon(Icons.task_alt),
                                  label: Text("Lịch sử đấu",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold))),
                              TextButton.icon(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white)),
                                  onPressed: () {},
                                  icon: const Icon(Icons.lock_person_rounded),
                                  label: const Text(
                                    "Đổi mật khẩu",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 0,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20.0)),
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            margin: const EdgeInsets.only(bottom: 15, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: () {},
                    child: const CircleAvatar(
                      foregroundColor: Colors.transparent,
                      foregroundImage: AssetImage("assets/img/Default.png"),
                    )),
                Text(
                  "AdminABC",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.yellow.shade600),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Image.asset(
                      'assets/icons/coin.png',
                      width: 40,
                      height: 40,
                    )),
                Text("1000"),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/icons/add.png'),
                  iconSize: 15,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 30,
                  ),
                ),
                Text("4:02"),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/icons/add.png'),
                  iconSize: 25,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(),
        ),
        Expanded(
          flex: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/icons/trophy.png'),
                iconSize: 40,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/icons/inventory.png'),
                  iconSize: 40,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/icons/shop.png'),
                iconSize: 40,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    'assets/logo.png',
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
