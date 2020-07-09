import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ramen/screens/home/entities/banner.dart';
import 'package:ramen/screens/home/entities/notice.dart';
import 'package:ramen/screens/shop_menu/entities/menu.dart';

class StaticDataRepository {
  static const _collection_menus = "menus";
  static const _collection_notices = "notices";
  static const _collection_banners = "banners";

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

  Stream<List<Notice>> getNotices() {
    var transformer = StreamTransformer<QuerySnapshot, List<Notice>>.fromHandlers(
        handleData: (snapshot, sink) {
          List<Notice> notice = snapshot.documents.map((doc) => Notice.fromDocument(doc)).toList();
          sink.add(notice);
        }
    );
    return Firestore.instance
        .collection(_collection_notices)
        .snapshots()
        .transform(transformer);
  }

  Stream<List<Banner>> getBanners() {
    var transformer = StreamTransformer<QuerySnapshot, List<Banner>>.fromHandlers(
        handleData: (snapshot, sink) {
          List<Banner> banners = snapshot.documents.map((doc) => Banner.fromDocument(doc)).toList();
          sink.add(banners);
        }
    );
    return Firestore.instance
        .collection(_collection_banners)
        .snapshots()
        .transform(transformer);
  }
}