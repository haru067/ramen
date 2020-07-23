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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _getNoticeWidgets(context, snapshot),
            ),
          );
        });
  }

  List<Widget> _getNoticeWidgets(
      BuildContext context, AsyncSnapshot<List<Notice>> snapshot) {
    List<Widget> widgets = [NoticeHeader()];
    if (snapshot.data != null) {
      List<Widget> notices =
          snapshot.data.map((notice) => NoticeWidget(notice)).toList();
      notices.forEach((w) => widgets.add(w));
    }
    return widgets;
  }
}

class NoticeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black12),
          ),
        ),
        padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
        margin: EdgeInsets.only(left: 16.0, right: 16.0),
        child: Text("お知らせ", style: Theme.of(context).textTheme.headline6));
  }
}

class NoticeWidget extends StatelessWidget {
  final Notice notice;

  NoticeWidget(this.notice);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Container(
            child: Container(
                margin: EdgeInsets.only(left: 16.0, right: 16.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black12),
                  ),
                ),
                child: _buildContents(context))));
  }

  Widget _buildContents(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
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
        Text(notice.createdAt.toLocal().toString(),
            style: Theme.of(context).textTheme.subtitle1),
        Container(height: 4),
        Text(notice.description, style: Theme.of(context).textTheme.bodyText1),
        Container(height: 16),
      ]),
    ]);
  }
}
