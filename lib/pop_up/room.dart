import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/screens/multi_play.dart';
import '../components/header_bar.dart';
import '../components/right_button.dart';
import '../components/setting_screenshot.dart';

class room_screen extends StatefulWidget {
  const room_screen({super.key});

  @override
  State<room_screen> createState() => _room_screenState();
}

class _room_screenState extends State<room_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 255, 193, 7),
      body: SingleChildScrollView(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.7,
                          height: MediaQuery.of(context).size.height / 1.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Color.fromARGB(156, 242, 247, 244)
                                  .withOpacity(0.8),
                              border: Border.all(width: 2)),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 15),
                                height:
                                    MediaQuery.of(context).size.height / 8.5,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      const Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('ID',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('0401'),
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 0.5,
                                                color: Colors.black),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(8, 8, 10, 5),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: 'ID',
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                              ),
                                              prefixIcon: Icon(Icons.search),
                                            ),
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size(20, 40),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          'Ok',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Image.asset(
                                            'assets/icons/exit.png'),
                                      )
                                    ]),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding:
                                            EdgeInsets.fromLTRB(30, 2, 0, 10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                width: 0.5,
                                                color: Colors.black),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromARGB(
                                                        255, 12, 12, 12)
                                                    .withOpacity(0.5),

                                                blurRadius: 7,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: User(),
                                      ),
                                    ),
                                    Expanded(
                                      child: Image.asset(
                                        "assets/icons/vs.png",
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding:
                                            EdgeInsets.fromLTRB(30, 2, 0, 10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                width: 0.5,
                                                color: Colors.black),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromARGB(
                                                        255, 12, 12, 12)
                                                    .withOpacity(0.5),

                                                blurRadius: 7,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: User(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => multi_play()),
                                      (route) => false);
                                },
                                child: Text(
                                  'Bắt Đầu',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}

class User extends StatelessWidget {
  const User({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 15,
                  offset: Offset(-5, 5),
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/img/Default.png"),
            ),
          ),
        ),
        Text(
          'Name: AdminAbc',
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: Text('ID: 079079'),
        ),
        Text('Rank: Bac'),
      ],
    );
  }
}