import 'package:flutter/material.dart';

class right_button extends StatelessWidget {
  const right_button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 4.8),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 5,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Colors.deepPurple.shade300.withOpacity(0.8))),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Vượt ải",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    Image.asset('assets/icons/goal.png')
                  ],
                )),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 5,
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Colors.deepPurple.shade300.withOpacity(0.8))),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Xếp hạng",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                      Image.asset('assets/icons/goal.png')
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
