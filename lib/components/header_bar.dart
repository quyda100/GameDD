import 'package:flutter/material.dart';
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
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.5),
                borderRadius: BorderRadius.circular(20.0)),
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            margin: EdgeInsets.only(bottom: 15, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/img/Default.png",
                    fit: BoxFit.cover,
                  ),
                  iconSize: 45,
                ),
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
                  iconSize: 25,
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
                  iconSize: 25,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/icons/trophy.png'),
                iconSize: 40,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/icons/inventory.png'),
                  iconSize: 40,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/icons/shop.png'),
                iconSize: 40,
              ),
            ],
          ),
        )
      ],
    );
  }
}
