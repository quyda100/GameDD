import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/login.dart';

class formlog extends StatefulWidget {
  const formlog({super.key});

  @override
  State<formlog> createState() => _formlogState();
}

class _formlogState extends State<formlog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
                ),
                child: Row(
                  children: [
                  Image.asset(
                    'assets/logo.png',
                    width: 300,
                    height: 350,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                        children: [
                          const Text(
                            'Đăng Nhập',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                              fontSize: 30,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              style: TextStyle(color: Colors.yellow),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.yellow,
                                  )),
                                  border: OutlineInputBorder(),
                                  hintText: 'Tài khoản',
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                  )),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              style: TextStyle(color: Colors.yellow),
                              decoration: InputDecoration(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () => {},
                                  child: const Text(
                                    'Đăng nhập',
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
                                TextButton(
                                  onPressed: () => {},
                                  child: const Text(
                                    'Quên Mật khẩu',
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
                                TextButton(
                                  onPressed: () => {},
                                  child: const Text(
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
                ]))));

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
