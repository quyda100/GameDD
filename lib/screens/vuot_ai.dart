import 'package:flutter/material.dart';
import '../components/setting_screenshot.dart';
import '../components/right_button.dart';
import '../components/header_bar.dart';

class VuotAi extends StatefulWidget {
  const VuotAi({super.key});

  @override
  State<VuotAi> createState() => _VuotAiState();
}

class _VuotAiState extends State<VuotAi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover)),
        padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header_bar(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                setting_screenshot(),
                Expanded(
                  child: Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      width: MediaQuery.of(context).size.width / 1.7,
                      height: MediaQuery.of(context).size.height / 1.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.deepPurple.shade300.withOpacity(0.8),
                          border: Border.all(width: 2)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(width: 2),
                                  image: DecorationImage(
                                    image: AssetImage("assets/bg.jpg"),
                                    fit: BoxFit.cover,
                                  )),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Ai(),
                                    Ai(),
                                    Ai(),
                                    Ai(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 130,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(Colors.red),
                                    ),
                                    child: Text("Chương trước"),
                                  ),
                                ),
                                SizedBox(
                                  width: 130,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(Colors.red),
                                    ),
                                    child: Text("Chương kế"),
                                  ),
                                ),
                                SizedBox(
                                  width: 130,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pushNamed(context, 'home');
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(Colors.red),
                                    ),
                                    child: Text("Quay lại"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Ai extends StatelessWidget {
  const Ai({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
      margin: EdgeInsets.fromLTRB(10, 10, 15, 10),
      decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(18.0),
          color: Colors.white),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset("assets/icons/vong.png"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/menu.png')),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/donghocat.png')),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/lich.png')),
              ],
            ),
          ),
          Row(
            children: [
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
    );
  }
}
