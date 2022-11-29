import 'package:flutter/material.dart';
import 'package:flutter_application_1/pop_up/bag.dart';
import 'package:indexed/indexed.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'package:flutter_application_1/pop_up/profile.dart';

import 'icon_button.dart';

class header_bar extends StatefulWidget {
  const header_bar({super.key});

  @override
  State<header_bar> createState() => _header_barState();
}

class _header_barState extends State<header_bar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
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
                                  title: Text('sad'),
                                  backgroundColor:
                                      Color.fromARGB(0, 246, 246, 246),
                                  content: Container(
                                    height: 200,
                                    width: 500.0,
                                    child: Text('ghngfdrg'),
                                  ),
                                ));
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/bg.png'),
                      ),
                    ),
                  ),
                ),
                Indexed(
                  index: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(143, 16, 10, 10),
                        borderRadius: BorderRadius.circular(20.0)),
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    margin: EdgeInsets.only(bottom: 15, top: 10, left: 10),
                    child: Row(
                      children: [
                        Expanded(child: Text("")),
                        Text(
                          "AdminABC",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.yellow.shade600),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Image.asset(
                              'assets/icons/coin.png',
                              width: 40,
                              height: 40,
                            )),
                        Text("1000"),
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
                        Text("4:02"),
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
          child: Text(""),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: IconButton(
                  onPressed: () {},
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
                  onPressed: () {},
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
  }
}
