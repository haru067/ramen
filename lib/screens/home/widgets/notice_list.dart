import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ramen/main_bloc.dart';
import 'package:ramen/screens/home/entities/notice.dart';
import 'package:url_launcher/url_launcher.dart';

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
        onTap: _launchUrl,
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
      Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            Container(height: 14),
            _buildTitleLine(context),
            Container(height: 4),
            Text(notice.description,
                style: Theme.of(context).textTheme.bodyText1),
            Container(height: 16),
          ])),
    ]);
  }

  Widget _buildTitleLine(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(notice.title, style: Theme.of(context).textTheme.subtitle1),
          Container(
            margin: EdgeInsets.only(left: 4, right: 8),
            child: Text(DateFormat("yyyy/MM/dd hh:mm").format(notice.createdAt),
                style: Theme.of(context).textTheme.caption),
          )
        ]);
  }

  _launchUrl() async {
    final String url = notice.url;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
