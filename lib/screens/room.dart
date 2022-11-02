import 'package:flutter/material.dart';
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
      body: SingleChildScrollView(
        child: Container(
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
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      margin: EdgeInsets.only(left: 30),
                      width: MediaQuery.of(context).size.width / 1.7,
                      height: MediaQuery.of(context).size.height / 1.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.deepPurple.shade300.withOpacity(0.8),
                          border: Border.all(width: 2)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 8.5,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Padding(
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
                                            width: 2.0, color: Colors.black)),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: 'ID',
                                          border: OutlineInputBorder(),
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
                                      onPressed: () {},
                                      icon:
                                          Image.asset('assets/icons/exit.png'))
                                ]),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(20, 2, 0, 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 1, color: Colors.black),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Color.fromARGB(255, 178, 177, 169)
                                                  .withOpacity(0.5),

                                          blurRadius: 8,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 8, 0, 8),
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              "assets/img/Default.png"),
                                        ),
                                      ),
                                      Text(
                                        'Name: AdminAbc',
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 8, 0, 8),
                                        child: Text('ID: 079079'),
                                      ),
                                      Text('Rank: Bac'),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Image.asset(
                                  "assets/icons/vs.png",
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 2, 20, 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 1, color: Colors.black),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Color.fromARGB(255, 178, 177, 169)
                                                  .withOpacity(0.5),

                                          blurRadius: 8,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 8, 0, 8),
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              "assets/img/Default.png"),
                                        ),
                                      ),
                                      Text(
                                        'Name: AdminAbc',
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 8, 0, 8),
                                        child: Text('ID: 079079'),
                                      ),
                                      Text('Rank: Bac'),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Bắt Đầu',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                    right_button()
                  ],
                )
              ],
            )),
      ),
    );
  }
}
