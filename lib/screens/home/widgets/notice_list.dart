import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ramen/main_bloc.dart';
import 'package:ramen/screens/home/entities/notice.dart';

class NoticeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainBloc = Provider.of<MainBloc>(context);
    return StreamBuilder<List<Notice>>(
        initialData: List(),
        stream: mainBloc.notices,
        builder: (BuildContext context, AsyncSnapshot<List<Notice>> snapshot) {
          return Container(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _getNoticeWidgets(context, snapshot),
            ),
          );
        });
  }

  List<Widget> _getNoticeWidgets(
      BuildContext context, AsyncSnapshot<List<Notice>> snapshot) {
    var header = Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black12),
          ),
        ),
        padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
        child: Text("お知らせ", style: Theme.of(context).textTheme.headline6));
    List<Widget> widgets = [header];
    if (snapshot.data != null) {
      List<Widget> notices = snapshot.data
          .map((notice) => _getNoticeWidget(context, notice))
          .toList();
      notices.forEach((w) => widgets.add(w));
    }
    return widgets;
  }

  Widget _getNoticeWidget(BuildContext context, Notice notice) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black12),
        ),
      ),
      child:
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 24, top: 16),
            child: Icon(
              Icons.info,
              size: 24,
              color: Colors.blue,
            )),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Container(height: 14),
          Text(notice.title, style: Theme.of(context).textTheme.subtitle1),
          Text(notice.createdAt.toLocal().toString(), style: Theme.of(context).textTheme.subtitle1),
          Container(height: 4),
          Text(notice.description,
              style: Theme.of(context).textTheme.bodyText1),
          Container(height: 16),
        ]),
      ]),
    );
  }
}
