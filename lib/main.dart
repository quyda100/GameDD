import 'package:cloud_firestore/cloud_firestore.dart';
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

      // home: AddQuestion(),
      routes: {
        'login': (context) => login_screen(),
        'home': (context) => home(),
        'unRemmemberPass': (context) => unRememberPass(),
        'UpdatePasss': (context) => UpdatePasss(),
        'CreateAccount': (context) => CreateAccount(),
        'Pay': (context) => Pay(),
      },
    );
  }
}

// class AddQuestion extends StatefulWidget {
//   const AddQuestion({super.key});

//   @override
//   State<AddQuestion> createState() => _AddQuestionState();
// }

// class _AddQuestionState extends State<AddQuestion> {
//   final _fireStore = FirebaseFirestore.instance;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//       child: ElevatedButton(
//           onPressed: () {
//             _fireStore.collection("SimpleQuestions").add({
//               'Id': 55,
//               'Title':
//                   "Tổ chức hiệp ước Vác-sa-va trở thành một đối trọng với khối quân sự nào của Mĩ ?",
//               'Answer': [
//                 "Khối SEATO",
//                 "Khối CENTO",
//                 "Khối NATO",
//                 "Khối ANZUSS"
//               ],
//               'Key': 2,
//               'Point': 20,
//               // 'Subject': {'Id': 5, 'Title': "Lịch sử"},
//               // 'Chapter': {'Id': 3, 'Title': "Về đích"}
//               'type': {'id': 2, 'Title': 'Xếp Hạng'}
//             }).then((value) {
//               final snackBar = SnackBar(content: Text("Thêm thành công"));
//               ScaffoldMessenger.of(context).showSnackBar(snackBar);
//             }).onError((error, stackTrace) {
//               final snackBar = SnackBar(content: Text("Có Lỗi Xảy Ra"));
//               ScaffoldMessenger.of(context).showSnackBar(snackBar);
//             });
//           },
//           child: Text("Nhấn vào")),
//     ));
//   }
// }
