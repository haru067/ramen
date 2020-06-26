import 'package:flutter/material.dart';

class MenuListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: Image.network(
              "https://haru067.com/img/me.png",
              width: 100,
              height: 56,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "醬油ラーメン",
                  style: Theme
                      .of(context)
                      .textTheme
                      .subtitle1,
                ),
                Text(
                  "鶏と煮干しで出汁をとった、昔ながらのラーメンです。",
                  style: Theme
                      .of(context)
                      .textTheme
                      .caption,
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 16.0, right: 16.0),
              child: Text(
                "700円",
                style: Theme
                    .of(context)
                    .textTheme
                    .headline6,
              )
          ),
        ],
      ),
    );
  }
}
