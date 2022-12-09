import 'package:cloud_firestore/cloud_firestore.dart';

class Subject {
  int id;
  String image;
  int point;
  Subject({required this.id, required this.image, required this.point});

  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'Image': image,
      'Point': point,
    };
  }

  Subject.fromMap(Map<String, dynamic> subjectMap)
      : id = subjectMap["Id"],
        image = subjectMap["Image"],
        point = subjectMap["Point"];

  Subject.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.data()!["Id"],
        image = doc.data()!["Image"],
        point = doc.data()!["Point"];
}
