import 'package:flutter/material.dart';

class MenuListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.network("https://haru067.com/img/me.png"),
        Column(
          children: <Widget>[
            Text("data"),
            Text("dataaaa"),
          ],
        ),
        Text("700円")
      ],
    );
  }
}
