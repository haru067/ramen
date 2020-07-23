import 'package:cloud_firestore/cloud_firestore.dart';

class Notice{
  String title;
  String description;
  String url;
  DateTime createdAt;

  Notice(this.title, this.description, this.url, this.createdAt);

  Notice.fromDocument(DocumentSnapshot doc):
        title = doc.data["title"],
        description = doc.data["description"],
        url = doc.data["url"],
        createdAt = (doc.data["createdAt"] as Timestamp).toDate();
}