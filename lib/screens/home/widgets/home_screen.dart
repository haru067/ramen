import 'package:flutter/material.dart';
import 'package:ramen/screens/home/widgets/banner_widget.dart';
import 'package:ramen/screens/home/widgets/notice_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      BannerWidget(),
      NoticeList(),
    ]);
  }
}
