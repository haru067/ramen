import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ramen/main_bloc.dart';
import 'package:ramen/screens/home/entities/banner.dart';

class StatusWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.green.shade500.withOpacity(0.87),
      padding: EdgeInsets.only(top: 4, bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("営業中", style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.white))
          ]),
    );
  }
}
