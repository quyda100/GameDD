import 'package:flutter/material.dart';

class shop extends StatefulWidget {
  const shop({super.key});

  @override
  State<shop> createState() => __screenState();
}

class showitem extends StatelessWidget {
  String icon;
  String name;
  int dau;
  showitem(
      {super.key, required this.icon, required this.name, required this.dau});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(18.0),
          color: Color.fromARGB(255, 158, 208, 216),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/icons/${this.icon}', width: 40, height: 40),
            Text(
              "${this.name}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.only(right: 30),
              child: Text(
                "${this.dau}",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class __screenState extends State<shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 255, 193, 7),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(8, 3, 8, 0),
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(18.0),
                  color: const Color.fromARGB(255, 175, 99, 132),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Vật Phẩm",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Tên vật phẩm",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 30),
                      child: Text(
                        "Đậu",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              showitem(icon: '50.png', name: '50 phần trăm', dau: 10000),
              showitem(icon: 'heart.png', name: '50 phần trăm', dau: 10000),
              showitem(icon: 'heart.png', name: '50 phần trăm', dau: 30000),
              showitem(icon: 'heart.png', name: '50 phần trăm', dau: 10000),
              showitem(icon: 'heart.png', name: '50 phần trăm', dau: 40000),
              showitem(icon: 'heart.png', name: '50 phần trăm', dau: 10000),
            ],
          ),
        ),
      ),
    );
  }
}
