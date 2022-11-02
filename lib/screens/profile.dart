import 'package:flutter/material.dart';
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
        padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header_bar(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                setting_screenshot(),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 30),
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
                            Padding(
                              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: Icon(
                                Icons.account_circle_rounded,
                                size: 50,
                              ),
                            ),
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
                                onPressed: () {},
                                icon: Icon(Icons.close_rounded))
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
                                children: [
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
                          padding: EdgeInsets.fromLTRB(40, 10, 40, 0),
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
                                  icon: Icon(Icons.lock_person_rounded),
                                  label: Text(
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
                right_button()
              ],
            )
          ],
        ),
      ),
    );
  }
}
