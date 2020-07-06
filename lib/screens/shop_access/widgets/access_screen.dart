import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Map(),
        _buildShopSummary(),
      ],
    );
  }

  Widget _buildShopSummary() {
    Widget shopSummary = Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text("adasfs"),
        Text("adasfs"),
        Text("adasfs"),
        Text("adasfs"),
      ],
    );
    return Container(
        padding: const EdgeInsets.only(top: 0, bottom: 16, right: 24, left: 24),
        alignment: Alignment.bottomCenter,
        child: Container(
            padding: const EdgeInsets.all(16),
            // color: Colors.white70,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white70,
                border: Border.all(
                  color: Colors.black12,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(4)),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[shopSummary],
            )));
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
