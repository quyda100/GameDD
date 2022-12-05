import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pop_up/bag.dart';
import 'package:flutter_application_1/pop_up/shop.dart';
import 'package:indexed/indexed.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'package:flutter_application_1/pop_up/profile.dart';

import '../pop_up/paydiscount.dart';
import 'icon_button.dart';

class header_bar extends StatefulWidget {
  const header_bar({super.key});

  @override
  State<header_bar> createState() => _header_barState();
}

class _header_barState extends State<header_bar> {
  final _auth = FirebaseAuth.instance;
  @override
  bool showShop = true;
  bool showPay = false;
  Widget build(BuildContext context) {
    var users = FirebaseFirestore.instance
        .collection("Users")
        .where('uid', isEqualTo: _auth.currentUser!.email)
        .snapshots();
    return StreamBuilder<QuerySnapshot>(
        stream: users,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final user = snapshot.data!.docs;
          return Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  child: Indexer(
                    children: [
                      Indexed(
                        index: 3,
                        child: Container(
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        backgroundColor:
                                            Color.fromARGB(0, 246, 246, 246),
                                        content: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              1,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                          child: profile_screen(),
                                        ),
                                      ));
                            },
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                  'assets/img/${user[0]['Avatar']}'), //${user[0]['Avatar']}
                            ),
                          ),
                        ),
                      ),
                      Indexed(
                        index: 2,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(143, 16, 10, 10),
                              borderRadius: BorderRadius.circular(20.0)),
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          margin:
                              EdgeInsets.only(bottom: 15, top: 10, left: 13),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(25, 5, 0, 5),
                                child: Text(
                                  "${user[0]['DisplayName']}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.yellow.shade600),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Image.asset(
                                    'assets/icons/coin.png',
                                    width: 40,
                                    height: 40,
                                  )),
                              Text(
                                "${user[0]['Coin']}",
                                style: TextStyle(color: Colors.white),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset('assets/icons/add.png'),
                                iconSize: 15,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 30,
                                ),
                              ),
                              Text(
                                "4:02",
                                style: TextStyle(color: Colors.white),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset('assets/icons/add.png'),
                                iconSize: 15,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    backgroundColor:
                                        Color.fromARGB(0, 246, 246, 246),
                                    content: Container(
                                      height: 280,
                                      width: 700.0,
                                      child: Text(''),
                                    ),
                                  ));
                        },
                        icon: Image.asset('assets/icons/trophy.png'),
                        iconSize: 40,
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {
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
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Túi Đồ',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                    backgroundColor:
                                        Color.fromARGB(132, 219, 212, 212),
                                    content: Container(
                                      height: 280,
                                      width: 700.0,
                                      child: Bag(),
                                    ),
                                  ));
                        },
                        icon: Image.asset('assets/icons/inventory.png'),
                        iconSize: 40,
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: TextButton(
                                              onPressed: () {},
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 255, 193, 7),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      'assets/icons/setting.png',
                                                      width: 30,
                                                    ),
                                                    Text(
                                                      'Cửa hàng',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: TextButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        AlertDialog(
                                                          content: Container(
                                                            height: 200,
                                                            width: 600.0,
                                                            child:
                                                                paydiscourt(),
                                                          ),
                                                        ));
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.amber,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      'assets/icons/setting.png',
                                                      width: 30,
                                                    ),
                                                    Text(
                                                      'Nạp thẻ',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    content: Container(
                                      height: 200,
                                      width: 600.0,
                                      child: shop(),
                                    ),
                                  ));
                        },
                        icon: Image.asset('assets/icons/shop.png'),
                        iconSize: 40,
                      ),
                    ),
                    Expanded(
                      child: WidgetAnimator(
                        incomingEffect:
                            WidgetTransitionEffects.incomingSlideInFromLeft(),
                        atRestEffect: WidgetRestingEffects.swing(),
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/logo.png'),
                          iconSize: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }
}
