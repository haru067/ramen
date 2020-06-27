import 'package:flutter/material.dart';
import 'package:ramen/screens/home/notice.dart';

class NoticeList extends StatelessWidget {
  final List<Notice> list;

  NoticeList(this.list);

  @override
  Widget build(BuildContext context) {
    return Column(children: _getListData(context));
  }

  List<Widget> _getListData(BuildContext context) {
    List<Widget> widgets = [Text("お知らせ", style: Theme.of(context).textTheme.headline6)];
    for (int i = 0; i < 100; i++) {
      widgets.add(Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("Row $i"),
      ));
    }
    return widgets;
  }
}

class NoticeListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("title");
  }
}
