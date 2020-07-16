import 'package:flutter/material.dart';

import '../entities/menu.dart';

class MenuListItem extends StatelessWidget {
  final Menu menu;

  MenuListItem(this.menu);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/shop-menu', arguments: menu);
      },
      child: Container(
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
                    menu.title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    menu.subTitle,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 16.0, right: 16.0),
                child: Text(
                  "${menu.price}円",
                  style: Theme.of(context).textTheme.headline6,
                )),
          ],
        ),
      ),
    );
  }
}
