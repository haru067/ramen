
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ramen/main_bloc.dart';
import 'package:ramen/screens/shop_menu/entities/menu.dart';

import 'menu_list_item.dart';

class MenuScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final mainBloc = Provider.of<MainBloc>(context);
    return StreamBuilder<List<Menu>>(
        initialData: List(),
        stream: mainBloc.menus,
        builder: (BuildContext context, AsyncSnapshot<List<Menu>> snapshot) {
          if (snapshot.data == null) return Container();

          List<Widget> menuItems = snapshot.data.map((menu) => MenuListItem(menu)).toList();
          return ListView(children: menuItems);
        }
    );
  }
}