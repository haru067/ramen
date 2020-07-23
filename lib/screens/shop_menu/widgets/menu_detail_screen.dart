import 'package:flutter/material.dart';
import 'package:ramen/screens/shop_menu/entities/menu.dart';

class MenuDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Menu menu = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black87),
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          title: Text(menu.title,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.black87)),
        ),
        body: _buildBody(context, menu));
  }

  Widget _buildBody(BuildContext context, Menu menu) {
    return ListView(
      children: <Widget>[
        _buildHeader(menu),
        Container(
          margin: EdgeInsets.only(right: 16, left: 16, top: 16, bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildTitleLine(context, menu),
              Padding(
                padding: EdgeInsets.only(top: 2, bottom: 16),
                child: _buildRating(),
              ),
              /*
              Padding(
                padding: EdgeInsets.only(top: 16, bottom: 16),
                child: Text("${menu.price}円",
                    style: Theme.of(context).textTheme.subtitle1),
              ),
               */
              Text(menu.subTitle, style: Theme.of(context).textTheme.bodyText1),
              Padding(padding: const EdgeInsets.all(8)),
              OutlineButton.icon(
                icon: Icon(Icons.edit),
                label: Text("レビューを書く"),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildHeader(Menu menu) {
    if (menu == null) return Container();

    return AspectRatio(
      aspectRatio: 16 / 9,
        child: Container(
      height: 320,
      color: Colors.blueGrey,
      alignment: Alignment.center,
      child: Container(
          color: Colors.blueGrey,
          constraints: BoxConstraints.expand(),
          child: Image.network("${menu.imageUrl}", fit: BoxFit.cover)),
    ));
  }

  Widget _buildTitleLine(BuildContext context, Menu menu) {
    return Row(children: [
      Expanded(
          child:
              Text(menu.title, style: Theme.of(context).textTheme.headline5)),
      Container(
        margin: EdgeInsets.only(left: 16.0, right: 16.0),
        child: Text("${menu.price}円",
            style: Theme.of(context).textTheme.headline5),
      ),
    ]);
  }

  Widget _buildRating() {
    return Row(children: [
      Icon(Icons.star, color: Colors.orange, size: 16),
      Icon(Icons.star, color: Colors.orange, size: 16),
      Icon(Icons.star, color: Colors.orange, size: 16),
      Icon(Icons.star_border, color: Colors.orange, size: 16),
      Icon(Icons.star_border, color: Colors.orange, size: 16),
      Padding(padding: EdgeInsets.only(left: 8), child: Text("3.5 (431)")),
    ]);
  }
}
