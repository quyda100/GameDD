import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/unRememberPass.dart';

import 'UpdatePasss.dart';
import 'login.dart';

class unRememberPass extends StatelessWidget {
  const unRememberPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
                ),
                child: Container(
                  margin: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Color.fromARGB(208, 255, 255, 255),
                      border: Border.all(width: 0.5)),
                  child: Container(
                      width: MediaQuery.of(context).size.width / 0.8,
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  width: MediaQuery.of(context).size.width / 4,
                                  height:
                                      MediaQuery.of(context).size.width / 3.1,
                                  child: IconButton(
                                    icon: Image.asset(
                                      'assets/logo.png',
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  login_screen()));
                                    },
                                  ),
                                ),
                                Text(
                                  'Quên mật khẩu',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: TextField(
                                      style: TextStyle(color: Colors.yellow),
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                            width: 1,
                                            color: Colors.yellow,
                                          )),
                                          border: OutlineInputBorder(),
                                          hintText: 'Email tài khoản',
                                          hintStyle: TextStyle(
                                            color: Colors.black,
                                          )),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: TextField(
                                      style: TextStyle(color: Colors.yellow),
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                            width: 1,
                                            color: Colors.yellow,
                                          )),
                                          border: OutlineInputBorder(),
                                          hintText: 'Nhập mã OTP',
                                          hintStyle: TextStyle(
                                            color: Colors.black,
                                          )),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                          onPressed: () => {},
                                          child: Text(
                                            'Gửi mã OTP',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                      Color.fromARGB(
                                                          90, 12, 155, 38)),
                                              padding: MaterialStatePropertyAll(
                                                  EdgeInsets.all(20))),
                                        ),
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        UpdatePasss()))
                                          },
                                          child: Text(
                                            'Lấy lại mật khẩu',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                      Color.fromARGB(
                                                          90, 12, 155, 38)),
                                              padding: MaterialStatePropertyAll(
                                                  EdgeInsets.all(20))),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ))
                        ],
                      )),
                ))));

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
