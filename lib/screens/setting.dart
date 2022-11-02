import 'package:flutter/material.dart';
import '../components/header_bar.dart';
import '../components/right_button.dart';
import '../components/setting_screenshot.dart';

class setting extends StatefulWidget {
  const setting({
    Key? key,
  }) : super(key: key);

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  double hieuung = 20;
  double amluong = 20;
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
                      margin: EdgeInsets.only(left: 20),
                      width: MediaQuery.of(context).size.width / 1.7,
                      height: MediaQuery.of(context).size.height / 1.7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.deepPurple.shade300.withOpacity(0.8),
                          border: Border.all(width: 0.1)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                margin: EdgeInsets.only(top: 5, left: 15),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.amber,
                                    border: Border.all(width: 0.1)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/icons/setting.png',
                                      width: 30,
                                    ),
                                    Text(
                                      'Cài đặt',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  onPressed: () => {},
                                  icon: Image.asset(
                                    'assets/icons/exit.png',
                                    width: 25,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                                padding: EdgeInsets.all(10),
                                child: TextButton(
                                  onPressed: () => {},
                                  child: Text(
                                    'Hướng dẫn',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Color.fromARGB(175, 7, 32, 255)),
                                      padding: MaterialStatePropertyAll(
                                          EdgeInsets.all(20))),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: TextButton(
                                  onPressed: () => {},
                                  child: Text(
                                    'Đăng xuất',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Color.fromARGB(223, 163, 6, 6)),
                                      padding: MaterialStatePropertyAll(
                                          EdgeInsets.all(20))),
                                ),
                              )
                            ],
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