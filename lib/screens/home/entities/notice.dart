import 'package:cloud_firestore/cloud_firestore.dart';

class Notice{
  String title;
  String description;

  Notice(this.title, this.description);

  Notice.fromDocument(DocumentSnapshot doc):
        title = doc.data["title"],
        description = doc.data["description"];
}