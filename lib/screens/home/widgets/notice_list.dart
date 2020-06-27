import 'package:flutter/material.dart';
import 'package:ramen/screens/home/notice.dart';

class NoticeList extends StatelessWidget {
  final List<Notice> list;

  NoticeList(this.list);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _getNoticeWidgets(context),
      ),
    );
  }

  List<Widget> _getNoticeWidgets(BuildContext context) {
    var header = Container(
      margin: EdgeInsets.only(bottom: 16.0),
        child: Text("お知らせ", style: Theme.of(context).textTheme.headline6)
    );
    List<Widget> widgets = [header];
    list.forEach((notice) => widgets.add(_getNoticeWidget(context, notice)));
    return widgets;
  }

  Widget _getNoticeWidget(BuildContext context, Notice notice) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(notice.title, style: Theme.of(context).textTheme.subtitle1),
        Text(notice.description, style: Theme.of(context).textTheme.bodyText2),
      ],
    );
  }
}

class NoticeListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("title");
  }
}
