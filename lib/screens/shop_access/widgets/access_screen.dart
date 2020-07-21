import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Map(),
        _buildShopSummary(context),
      ],
    );
  }

  _launchURL() async {
    // const url = 'https://twitter.com/haru067';
    const url = 'https://www.google.com/maps/@?api=1&map_action=map';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _buildShopSummary(BuildContext context) {
    Widget shopSummary = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("麺屋はる", style: Theme.of(context).textTheme.subtitle1),
        Text("東京都千代田区千代田１−１",  style: Theme.of(context).textTheme.caption),
        Padding(padding: const EdgeInsets.all(8)),
        Text("営業時間: 11:00 ~ 21:00",  style: Theme.of(context).textTheme.bodyText1),
        Text("定休日: 日",  style: Theme.of(context).textTheme.bodyText1),
        Padding(padding: const EdgeInsets.all(8)),
        Row(
          children: <Widget>[
            RaisedButton.icon(
                icon: Icon(Icons.map),
                label: Text("地図を開く"),
              color: Colors.blueAccent,
              textColor: Colors.white,
              onPressed: _launchURL,
            ),
            Padding(padding: const EdgeInsets.all(8)),
            RaisedButton.icon(
              icon: Icon(Icons.directions_bike),
              label: Text("Twitter"),
              color: Colors.blueAccent,
              textColor: Colors.white,
              onPressed: _launchURL,
            ),
          ],
        )
      ],
    );
    return Container(
        padding: const EdgeInsets.only(top: 0, bottom: 16, right: 24, left: 24),
        alignment: Alignment.bottomCenter,
        child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
                child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[shopSummary],
            ))));
  }
}

class Map extends StatefulWidget {
  @override
  State<Map> createState() => MapState();
}

class MapState extends State<Map> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _pos = CameraPosition(
    target: LatLng(34.7399064, 137.812359),
    zoom: 17.5,
  );

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _pos,
      zoomControlsEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
