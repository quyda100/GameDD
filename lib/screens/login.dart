import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/unRememberPass.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'CreateAccount.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/bg.gif"), fit: BoxFit.cover),
                ),
                child: Container(
                    margin: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: const Color.fromARGB(208, 255, 255, 255),
                        border: Border.all(width: 0.5)),
                    child: Container(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 0.8,
                        child: (Row(children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  width: MediaQuery.of(context).size.width / 4,
                                  height:
                                      MediaQuery.of(context).size.width / 2.8,
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
                                )
                              ],
                            ),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Column(
                                children: [
                                  const Padding(padding: EdgeInsets.all(20)),
                                  const Text(
                                    'Đăng Nhập',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 30,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: txtEmail,
                                      style:
                                          const TextStyle(color: Colors.yellow),
                                      decoration: const InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                            width: 1,
                                            color: Colors.yellow,
                                          )),
                                          border: OutlineInputBorder(),
                                          hintText: 'Email',
                                          hintStyle: TextStyle(
                                            color: Colors.black,
                                          )),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      style:
                                          const TextStyle(color: Colors.yellow),
                                      controller: txtPassword,
                                      decoration: const InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                            width: 1,
                                            color: Colors.yellow,
                                          )),
                                          border: OutlineInputBorder(),
                                          hintText: 'Mật khẩu',
                                          hintStyle: TextStyle(
                                            color: Colors.black,
                                          )),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                          onPressed: () async {
                                            try {
                                              final user = _auth
                                                  .signInWithEmailAndPassword(
                                                      email: txtEmail.text,
                                                      password:
                                                          txtPassword.text)
                                                  .then((value) {
                                                final snackBar = SnackBar(
                                                    content: Text(
                                                        'Đăng Nhập Thành Công'));
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                                sleep(
                                                    const Duration(seconds: 2));
                                                Navigator
                                                    .pushNamedAndRemoveUntil(
                                                        context,
                                                        'home',
                                                        (route) => false);
                                              });
                                              if (user == null) {
                                                final snackBar = SnackBar(
                                                    content: Text(
                                                        'Đăng Nhập Không Thành Công'));
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                              }
                                            } catch (e) {
                                              final snackBar = SnackBar(
                                                  content:
                                                      Text('Có Lỗi Xảy Ra'));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            }
                                          },
                                          child: Text(
                                            'Đăng nhập',
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
                                                        unRememberPass()))
                                          },
                                          child: Text(
                                            'Quên Mật khẩu',
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
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        (CreateAccount())))
                                          },
                                          child: Text(
                                            'Đăng ký',
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
                        ])),
                      ),
                    )))));

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
