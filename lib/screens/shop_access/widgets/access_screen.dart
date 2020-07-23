import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Map(),
        ShopSummary(),
      ],
    );
  }
}

class ShopSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget shopSummary = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("麺屋はる", style: Theme.of(context).textTheme.subtitle1),
        Text("東京都千代田区千代田１−１", style: Theme.of(context).textTheme.caption),
        Padding(padding: const EdgeInsets.all(8)),
        Text("営業時間: 11:00 ~ 21:00",
            style: Theme.of(context).textTheme.bodyText1),
        Text("定休日: 日", style: Theme.of(context).textTheme.bodyText1),
        Padding(padding: const EdgeInsets.all(4)),
        _buildButtons()
      ],
    );
    return Container(
        padding: const EdgeInsets.only(top: 16, bottom: 16, right: 24, left: 24),
        alignment: Alignment.bottomCenter,
        child: Card(
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[shopSummary],
                ))));
  }

  Widget _buildButtons() {
    return Row(
      children: <Widget>[
        OutlineButton.icon(
          icon: Icon(
            Icons.map,
            color: Colors.green.shade600,
          ),
          label: Text("地図を開く"),
          onPressed: _launchMap,
        ),
        Padding(padding: const EdgeInsets.all(8)),
        OutlineButton.icon(
          icon: SvgPicture.asset(
            'assets/twitter.svg',
            width: 28,
            height: 28,
          ),
          label: Text("Twitter"),
          onPressed: _launchTwitter,
        ),
      ],
    );
  }

  _launchMap() {
    _launchUrl('https://www.google.com/maps/@?api=1&map_action=map');
  }

  _launchTwitter() {
    _launchUrl('https://twitter.com/haru067');
  }

  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
