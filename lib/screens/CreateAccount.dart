import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/screens/unRememberPass.dart';
import 'home.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtusername = TextEditingController();
  TextEditingController txtPass = TextEditingController();
  TextEditingController txtRePass = TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bglog.gif"), fit: BoxFit.cover),
          ),
          child: Container(
            margin: const EdgeInsets.all(30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: const Color.fromARGB(208, 255, 255, 255),
                border: Border.all(width: 0.2)),
            child: Container(
              width: MediaQuery.of(context).size.width / 0.8,
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          width: MediaQuery.of(context).size.width / 4,
                          height: MediaQuery.of(context).size.width / 3.1,
                          child: IconButton(
                            icon: Image.asset(
                              'assets/logo.png',
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => login_screen()));
                            },
                          ),
                        ),
                        const Text(
                          'Đăng ký',
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
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: TextField(
                              controller: txtEmail,
                              keyboardType: TextInputType.emailAddress,
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
                            padding: const EdgeInsets.all(3.0),
                            child: TextField(
                              controller: txtusername,
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.yellow,
                                  )),
                                  border: OutlineInputBorder(),
                                  hintText: 'Tên Ingame',
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: TextField(
                              controller: txtPass,
                              obscureText: true,
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
                            padding: const EdgeInsets.all(3.0),
                            child: TextField(
                              controller: txtRePass,
                              obscureText: true,
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.yellow,
                                  )),
                                  border: OutlineInputBorder(),
                                  hintText: 'Nhập lại mật khẩu',
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () async {
                                    // if (txtPass.text != txtRePass.text ||
                                    //     txtPass.text != null) {
                                    //   final snackBar = SnackBar(
                                    //       content: Text(
                                    //           'Vui Lòng Kiểm Tra Lại Mật Khẩu'));
                                    //   ScaffoldMessenger.of(context)
                                    //       .showSnackBar(snackBar);
                                    // } else {
                                    try {
                                      final newUser =
                                          _auth.createUserWithEmailAndPassword(
                                              email: txtEmail.text,
                                              password: txtPass.text);
                                      if (newUser != null) {
                                        final snackBar = SnackBar(
                                            content:
                                                Text("Đăng Ký Thành Công"));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                        sleep(Duration(seconds: 1));
                                        Navigator.pop(context);
                                      } else {
                                        final snackBar = SnackBar(
                                            content:
                                                Text('Tài Khoản Không Hợp Lệ'));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                    } catch (e) {
                                      final snackBar = SnackBar(
                                          content: Text('Có Lỗi Xảy Ra'));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                    //}
                                  },
                                  child: Text(
                                    'Đăng ký',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Color.fromARGB(90, 12, 155, 38)),
                                      padding: MaterialStatePropertyAll(
                                          EdgeInsets.all(20))),
                                ),
                              ],
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
