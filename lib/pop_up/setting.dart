import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pop_up/tutolrial.dart';
import '../components/header_bar.dart';
import '../components/right_button.dart';
import '../components/setting_screenshot.dart';
import '../screens/login.dart';
import 'package:audioplayers/audioplayers.dart';

class setting extends StatefulWidget {
  const setting({
    Key? key,
  }) : super(key: key);
  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  bool isPlaying = true;
  double hieuung = 20;
  double amluong = 20;
  final _auth = FirebaseAuth.instance;
  final player = AudioCache();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 255, 193, 7),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Nhạc nền:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Slider(
                      value: amluong,
                      max: 100,
                      divisions: 20,
                      label: amluong.round().toString(),
                      onChanged: (double newvalue) {
                        setState(() {
                          amluong = newvalue;
                        });
                      })
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hiệu ứng:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Slider(
                    value: hieuung,
                    max: 100,
                    divisions: 20,
                    label: hieuung.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        hieuung = value;
                      });
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: TextButton(
                      onPressed: () => {
                        Navigator.pop(context),
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                              title: Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Text(''),
                                    ),
                                    Expanded(
                                      flex: 9,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.amber,
                                            border: Border.all(width: 0.1)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Hướng dẫn',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(''),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: IconButton(
                                        onPressed: () => {
                                          Navigator.pop(context),
                                        },
                                        icon: Image.asset(
                                          'assets/icons/exit.png',
                                          width: 25,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              backgroundColor: Color.fromARGB(96, 7, 77, 255),
                              content: Container(
                                child: tutolrial(),
                                height: 220.0,
                                width: 450.0,
                              )),
                          // actions: [
                          //   TextButton(
                          //       onPressed: () => Navigator.pop(context),
                          //       child: Text('ok'))
                          // ],
                        ),
                      },
                      child: Text(
                        'Hướng dẫn',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(175, 7, 32, 255)),
                          padding:
                              MaterialStatePropertyAll(EdgeInsets.all(15))),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () async {
                        try {
                          _auth.signOut();
                          final snackBar =
                              SnackBar(content: Text('Đăng Xuất Thành Công'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Navigator.pushNamedAndRemoveUntil(
                              context, 'login', (route) => false);
                        } catch (e) {
                          final snackBar =
                              SnackBar(content: Text('Có Lỗi Xảy Ra'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Text(
                        'Đăng xuất',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(223, 163, 6, 6)),
                          padding:
                              MaterialStatePropertyAll(EdgeInsets.all(15))),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
