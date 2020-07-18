import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ramen/main_bloc.dart';
import 'package:ramen/screens/home/entities/banner.dart';

class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainBloc = Provider.of<MainBloc>(context);
    return StreamBuilder<List<HomeBanner>>(
      initialData: List(),
      stream: mainBloc.banners,
      builder:
          (BuildContext context, AsyncSnapshot<List<HomeBanner>> snapshot) {
        HomeBanner banner =
            snapshot.data.length > 0 ? snapshot.data.first : null;
        return AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
                alignment: Alignment.center,
                child: _buildBanner(context, banner)));
      },
    );
  }

  Widget _buildBanner(BuildContext context, HomeBanner banner) {
    if (banner == null) return Container();

    return Container(
        constraints: BoxConstraints.expand(),
        child: Image.network("${banner.imageUrl}", fit: BoxFit.cover));
  }
}
