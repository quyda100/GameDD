import 'package:flutter/material.dart';
import '../components/header_bar.dart';

class ingame_screen extends StatefulWidget {
  const ingame_screen({super.key});

  @override
  State<ingame_screen> createState() => _ingame_screenState();
}

class _ingame_screenState extends State<ingame_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
        padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header_bar(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30),
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.height / 1.5,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.deepPurple.shade300.withOpacity(0.8),
                      border: Border.all(width: 2)),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/icons/math.png'),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Image.asset('assets/icons/menu.png')),
                                IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                        'assets/icons/donghocat.png')),
                                IconButton(
                                    onPressed: () {},
                                    icon: Image.asset('assets/icons/lich.png')),
                              ],
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(18.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(2.0, 2.0),
                                  blurRadius: 4.0,
                                  spreadRadius: 2.0,
                                )
                              ]),
                          child: Column(
                            children: [
                              Stack(children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                      'assets/icons/exit.png',
                                      width: 35,
                                      height: 35,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Image.asset('assets/icons/999.png'),
                                    const Text(
                                      "Xếp Hạng",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      single_rank(),
                                      single_rank(),
                                      single_rank(),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


