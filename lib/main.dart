import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/screens/Pay.dart';
import 'screens/CreateAccount.dart';
import 'screens/UpdatePasss.dart';
import 'screens/login.dart';
import 'screens/unRememberPass.dart';
import 'screens/home.dart';
import 'pop_up/room.dart';
import 'screens/Pay.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      initialRoute: 'login',
      routes: {
        'login': (context) => login_screen(),
        'home': (context) => home(),
        'room': (context) => room_screen(),
        'unRemmemberPass': (context) => unRememberPass(),
        'UpdatePasss': (context) => UpdatePasss(),
        'CreateAccount': (context) => CreateAccount(),
        'Pay': (context) => Pay(),
      },
    );
  }
}
