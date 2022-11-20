import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/components/login.dart';
import 'package:flutter_application_1/screens/multi_play.dart';
import 'package:flutter_application_1/screens/setting.dart';
import 'screens/highscore.dart';
import 'screens/profile.dart';
import 'screens/home.dart';
import 'screens/room.dart';
import 'screens/history_screen.dart';
import 'screens/formlog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]); // đặt màn hình ngang
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.immersiveSticky); // Hide statusbar
    return formlog();
  }
}
