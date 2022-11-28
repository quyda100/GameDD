import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/setting.dart';
import 'package:flutter_application_1/screens/vuot_ai.dart';
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
                image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
        padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
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
                        margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        width: MediaQuery.of(context).size.width / 5,
                        height: MediaQuery.of(context).size.width / 3,
                        child: IconButton(
                          icon: Image.asset("assets/img/vuotai.png"),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VuotAi()));
                          },
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                        height: MediaQuery.of(context).size.width / 3,
                        child: IconButton(
                          icon: Image.asset("assets/img/xephang.png"),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, 'room');
                          },
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
