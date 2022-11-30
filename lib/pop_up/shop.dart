import 'package:flutter/material.dart';
import 'package:flutter_application_1/pop_up/room.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import '../components/header_bar.dart';
import '../components/right_button.dart';

class shop extends StatefulWidget {
  const shop({
    Key? key,
  }) : super(key: key);
  @override
  State<shop> createState() => _shopState();
}

class nap extends StatelessWidget {
  const nap({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '10.000',
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
          child: Container(
            decoration: BoxDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '10.000 đậu',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _shopState extends State<shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 255, 193, 7),
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(210, 255, 193, 7),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Mệnh giá',
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
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 247, 216, 122),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Quy đổi',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            nap(),
            nap(),
            nap(),
            nap(),
            nap(),
            Center(
              child: Row(
                children: [
                  WidgetAnimator(
                    incomingEffect:
                        WidgetTransitionEffects.incomingSlideInFromRight(),
                    atRestEffect: WidgetRestingEffects.size(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 247, 216, 122),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Nạp nhanh',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
