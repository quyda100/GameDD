import 'package:flutter/material.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return (Row(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Image.asset(
                'assets/logo.png',
                width: 210,
              ),
              Text(
                'Đăng Ký',
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
            padding: EdgeInsets.only(top: 10),
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
                        hintText: 'Email',
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
                        hintText: 'Tài khoản',
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
                        hintText: 'Mật khẩu',
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
                        hintText: 'Nhập lại mật khẩu',
                        hintStyle: TextStyle(
                          color: Colors.black,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () => {},
                        child: Text(
                          'Đăng Nhập',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(90, 12, 155, 38)),
                            padding:
                                MaterialStatePropertyAll(EdgeInsets.all(20))),
                      ),
                      TextButton(
                        onPressed: () => {},
                        child: Text(
                          'Đăng ký',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(90, 12, 155, 38)),
                            padding:
                                MaterialStatePropertyAll(EdgeInsets.all(20))),
                      ),
                    ],
                  ),
                )
              ],
            ))
      ],
    ));

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
