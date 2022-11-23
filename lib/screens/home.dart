import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/setting.dart';
import '../components/setting_screenshot.dart';
import '../components/right_button.dart';
import '../components/header_bar.dart';

class home extends StatelessWidget {
  const home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover)),
        padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header_bar(),
            Row(
              children: [
                setting_screenshot(),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                        height: MediaQuery.of(context).size.width / 3,
                        child: IconButton(
                          icon: Image.asset(
                            "assets/img/choithu.png",
                            scale: 2,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        width: MediaQuery.of(context).size.width / 5,
                        height: MediaQuery.of(context).size.width / 3,
                        child: IconButton(
                          icon: Image.asset("assets/img/vuotai.png"),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                        height: MediaQuery.of(context).size.width / 3,
                        child: IconButton(
                          icon: Image.asset("assets/img/xephang.png"),
                          onPressed: () {},
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
  }
}
