// ignore_for_file: camel_case_types

import 'package:elegant_notification/elegant_notification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/unRememberPass.dart';
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
        resizeToAvoidBottomInset: false,
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg.gif"), fit: BoxFit.cover),
            ),
            child: Container(
                margin: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.white.withOpacity(0.6),
                    border: Border.all(width: 0.5)),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1,
                  child: (Row(children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            width: MediaQuery.of(context).size.width / 4,
                            height: MediaQuery.of(context).size.width / 3,
                            child: IconButton(
                              icon: Image.asset(
                                'assets/logo.png',
                              ),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Column(
                          children: [
                            const Padding(padding: EdgeInsets.all(20)),
                            const Text(
                              '????ng Nh???p',
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
                                // keyboardType: TextInputType.emailAddress,
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
                                    ),),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: txtPassword,
                                obscureText: true,
                                decoration: const InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.yellow,
                                    )),
                                    border: OutlineInputBorder(),
                                    hintText: 'M???t kh???u',
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
                                      if (txtEmail.text.isEmpty ||
                                          txtPassword.text.isEmpty) {
                                        ElegantNotification.error(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4,
                                                title: const Text("Th??ng b??o"),
                                                description: const Text(
                                                    "Vui L??ng Nh???p ????? Th??ng Tin"))
                                            .show(context);
                                        return;
                                      }
                                      try {
                                        await _auth.signInWithEmailAndPassword(
                                            email: txtEmail.text,
                                            password: txtPassword.text);

                                        _auth
                                            .authStateChanges()
                                            .listen((e) async {
                                          Future.delayed(const Duration(
                                              milliseconds: 300));
                                          if (e != null) {
                                            txtEmail.clear();
                                            txtPassword.clear();
                                            // ignore: use_build_context_synchronously
                                            ElegantNotification.success(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            4,
                                                    title:
                                                        const Text("Th??ng b??o"),
                                                    description: const Text(
                                                        "????ng Nh???p Th??nh C??ng"))
                                                .show(context);
                                            Future.delayed(
                                                const Duration(seconds: 2),
                                                () => Navigator
                                                    .pushNamedAndRemoveUntil(
                                                        context,
                                                        'home',
                                                        (route) => false));
                                          } else {
                                            ElegantNotification.error(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            4,
                                                    title:
                                                        const Text("Th??ng b??o"),
                                                    description: const Text(
                                                        "Sai Email Ho???c M???t Kh???u"))
                                                .show(context);
                                          }
                                        });
                                      } catch (e) {
                                        ElegantNotification.error(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4,
                                                title: const Text("Th??ng b??o"),
                                                description:
                                                    const Text("C?? L???i X???y Ra"))
                                            .show(context);
                                      }
                                    },
                                    // ignore: sort_child_properties_last
                                    child: const Text(
                                      '????ng nh???p',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    style: const ButtonStyle(
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
                                                  const unRememberPass()))
                                    },
                                    // ignore: sort_child_properties_last
                                    child: const Text(
                                      'Qu??n M???t kh???u',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    style: const ButtonStyle(
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
                                                  (const CreateAccount())))
                                    },
                                    // ignore: sort_child_properties_last
                                    child: const Text(
                                      '????ng k??',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    style: const ButtonStyle(
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
                ))));
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
