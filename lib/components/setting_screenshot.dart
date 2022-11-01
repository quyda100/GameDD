import 'package:flutter/material.dart';

class setting_screenshot extends StatelessWidget {
  const setting_screenshot({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
            padding: EdgeInsets.only(top: 3, bottom: 3),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset('assets/icons/setting.png'),
              iconSize: 30,
            )),
        IconButton(
          onPressed: () {},
          icon: Image.asset('assets/icons/camera.png'),
          iconSize: 30,
        )
      ],
    );
  }
}
