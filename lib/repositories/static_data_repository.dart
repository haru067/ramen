import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ramen/screens/shop_menu/entities/menu.dart';

class StaticDataRepository {
  static const _collection_menus = "menus";

  Stream<List<Menu>> getMenus() {
    var transformer = StreamTransformer<QuerySnapshot, List<Menu>>.fromHandlers(
        handleData: (snapshot, sink) {
          List<Menu> menus = snapshot.documents.map((doc) => Menu.fromDocument(doc)).toList();
          sink.add(menus);
        }
    );
    return Firestore.instance
        .collection(_collection_menus)
        .snapshots()
        .transform(transformer);
  }
}