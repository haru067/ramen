import 'package:cloud_firestore/cloud_firestore.dart';

class Banner{
  String url;
  String imageUrl;

  Banner(this.url, this.imageUrl);

  Banner.fromDocument(DocumentSnapshot doc):
        url = doc.data["url"],
        imageUrl = doc.data["imageUrl"];
}