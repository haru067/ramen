import 'package:flutter/material.dart';

class StampScreen extends StatelessWidget {
  static const _stampSize = 20;

  @override
  Widget build(BuildContext context) {
    List<Widget> stamps = List();
    for (int i = 0; i < _stampSize; i++) {
      stamps.add(_buildStamp(context, i));
    }
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(16),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      crossAxisCount: 3,
      children: stamps,
    );
  }

  Widget _buildStamp(BuildContext context, int index) {
    String message;
    TextStyle style = Theme.of(context).textTheme.headline5.copyWith(color: Colors.blueGrey);
    if (index % 15 == 0) {
      message = "$index\n大盛りトッピング無料";
      style = Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.blueGrey);
    } else if (index % 3 == 0) {
      message = "$index\nトッピング無料";
      style = Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.blueGrey);
    } else if (index % 5 == 0) {
      message = "$index\n大盛り無料";
      style = Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.blueGrey);
    } else {
      message = index.toString();
    }
    Text text = Text(message, style: style, textAlign: TextAlign.center);
    return Container(
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      child: text,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(
            color: Colors.blueGrey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8)),
    );
  }
}
