import 'package:flutter/material.dart';
import 'package:flutter_application_1/pop_up/room.dart';
import 'package:flutter_application_1/screens/single_play.dart';
import 'package:flutter_application_1/screens/vuot_ai.dart';
import '../components/setting_screenshot.dart';
import '../components/right_button.dart';
import '../components/header_bar.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class home extends StatelessWidget {
  const home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.gif"), fit: BoxFit.cover)),
        padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header_bar(),
            Row(
              children: [
                setting_screenshot(),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WidgetAnimator(
                        incomingEffect:
                            WidgetTransitionEffects.incomingSlideInFromLeft(),
                        atRestEffect: WidgetRestingEffects.fidget(),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 5,
                          height: MediaQuery.of(context).size.width / 3,
                          child: IconButton(
                            icon: Image.asset(
                              "assets/img/choithu.png",
                              scale: 2,
                            ),
                            onPressed: () {
                              // Navigator.pop(context);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => SinglePlay()));
                            },
                          ),
                        ),
                      ),
                      WidgetAnimator(
                        incomingEffect:
                            WidgetTransitionEffects.incomingSlideInFromRight(),
                        atRestEffect: WidgetRestingEffects.fidget(),
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          width: MediaQuery.of(context).size.width / 5,
                          height: MediaQuery.of(context).size.width / 3,
                          child: IconButton(
                            icon: Image.asset("assets/img/vuotai.png"),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        backgroundColor:
                                            Color.fromARGB(0, 246, 246, 246),
                                        content: Container(
                                          height: 280,
                                          width: 700.0,
                                          child: new VuotAi(
                                            chapter: 1,
                                          ),
                                        ),
                                      ));
                            },
                          ),
                        ),
                      ),
                      WidgetAnimator(
                        incomingEffect:
                            WidgetTransitionEffects.incomingSlideInFromBottom(),
                        atRestEffect: WidgetRestingEffects.fidget(),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 4.5,
                          height: MediaQuery.of(context).size.width / 3,
                          child: IconButton(
                            icon: Image.asset("assets/img/xephang.png"),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        backgroundColor:
                                            Color.fromARGB(0, 246, 246, 246),
                                        content: Container(
                                          height: 280,
                                          width: 580.0,
                                          child: room_screen(),
                                        ),
                                      ));
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
