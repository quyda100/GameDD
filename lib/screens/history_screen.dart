import 'package:flutter/material.dart';
import '../components/setting_screenshot.dart';
import '../components/right_button.dart';
import '../components/header_bar.dart';

class history_screen extends StatefulWidget {
  const history_screen({super.key});

  @override
  State<history_screen> createState() => _history_screenState();
}

class _history_screenState extends State<history_screen> {
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
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(20, 0, 15, 8),
                                  padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Text(
                                    "Lịch sử xếp hạng",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset('assets/icons/exit.png'),
                                iconSize: 30,
                              )
                            ],
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                                child: Column(
                              children: [
                                history_item(isWin: true),
                                history_item(isWin: true),
                                history_item(isWin: true),
                                history_item(isWin: false),
                              ],
                            )),
                          ),
                        ],
                      )),
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


