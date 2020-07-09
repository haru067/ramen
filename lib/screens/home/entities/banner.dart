import 'package:cloud_firestore/cloud_firestore.dart';

class HomeBanner{
  String url;
  String imageUrl;

  HomeBanner(this.url, this.imageUrl);

  HomeBanner.fromDocument(DocumentSnapshot doc):
        url = doc.data["url"],
        imageUrl = doc.data["imageUrl"];
}