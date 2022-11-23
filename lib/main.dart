import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/CreateAccount.dart';
import 'screens/UpdatePasss.dart';
import 'screens/login.dart';
import 'screens/multi_play.dart';
import 'screens/setting.dart';
import 'screens/unRememberPass.dart';
import 'screens/highscore.dart';
import 'screens/profile.dart';
import 'screens/home.dart';
import 'screens/room.dart';
import 'screens/history_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]); // đặt màn hình ngang
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: 'UpdatePasss',
      routes: {
        'login': (context) => login_screen(),
        'home': (context) => home(),
        'room': (context) => room_screen(),
        'unRemmemberPass': (context) => unRememberPass(),
        'UpdatePasss': (context) => UpdatePasss(),
        'CreateAccount': (context) => CreateAccount(),
      },
    );
  }
}
