import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/header_bar.dart';
import 'package:flutter_application_1/components/setting_screenshot.dart';
import '../components/right_button.dart';

class home_screen extends StatelessWidget {
  const home_screen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
          padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    'assets/icons/medal.png',
                                  ),
                                  iconSize: 45,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset('assets/icons/trophy.png'),
                                  iconSize: 45,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.diamond,
                                    color: Colors.blue,
                                  ),
                                  iconSize: 45,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  player_rank(),
                                  player_rank(),
                                  player_rank(),
                                  player_rank(),
                                  player_rank(),
                                ],
                              ),
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
          )),
    );
  }
}

class player_rank extends StatelessWidget {
  const player_rank({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
      height: MediaQuery.of(context).size.height / 7.5,
      margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(width: 1, color: Colors.green)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/img/Default.png'),
          ),
          Text(
            "AdminABC",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Kim cương",
            style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold),
          ),
          Image.asset(
            'assets/icons/trophy.png',
            scale: 2,
          ),
          Text(
            "TOP 1",
            style: TextStyle(
                color: Color.fromARGB(255, 240, 217, 8),
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
