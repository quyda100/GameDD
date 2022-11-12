import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/login.dart';
import 'package:flutter_application_1/components/CreateAccount.dart';
import '../components/UpdatePasss.dart';
import '../components/unRememberPass.dart';

class formlog extends StatefulWidget {
  const formlog({super.key});

  @override
  State<formlog> createState() => _formlogState();
}

class _formlogState extends State<formlog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
                ),
                child: Container(
                    margin: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: Color.fromARGB(208, 255, 255, 255),
                        border: Border.all(width: 0.5)),
                    child: Container(
                      child: login_screen(),
                    )))));

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
