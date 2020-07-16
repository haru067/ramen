import 'package:flutter/material.dart';
import 'package:ramen/screens/shop_menu/entities/menu.dart';

class MenuDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Menu menu = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text(menu.title),
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
              Text(menu.title, style: Theme.of(context).textTheme.headline6),
              Padding(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: Text("${menu.price}円",
                    style: Theme.of(context).textTheme.subtitle1),
              ),
              Text(menu.subTitle, style: Theme.of(context).textTheme.bodyText1),
              IconButton(icon: Icon(Icons.favorite_border), onPressed: null)
            ],
          ),
        )
      ],
    );
  }

  Widget _buildHeader(Menu menu) {
    if (menu == null) return Container();

    return Container(
      height: 320,
      color: Colors.blueGrey,
      alignment: Alignment.center,
      child: Container(
          color: Colors.blueGrey,
          constraints: BoxConstraints.expand(),
          child: Image.network("${menu.imageUrl}", fit: BoxFit.cover)),
    );
  }
}
