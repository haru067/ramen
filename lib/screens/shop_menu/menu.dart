import 'package:cloud_firestore/cloud_firestore.dart';

class Menu{
  String title;
  String subTitle;
  int price;
  String imageUrl;

  Menu(this.title, this.subTitle, this.price, this.imageUrl);

  @override
  Menu.fromDocument(DocumentSnapshot doc):
        title = doc.data["title"],
        subTitle = doc.data["subTitle"],
        price = doc.data["price"],
        imageUrl = doc.data["imageUrl"];
}