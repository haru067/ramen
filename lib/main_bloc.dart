import 'dart:async';

import 'package:ramen/repositories/static_data_repository.dart';
import 'package:ramen/screens/home/entities/banner.dart';
import 'package:ramen/screens/home/entities/notice.dart';
import 'package:ramen/screens/shop_menu/entities/menu.dart';

class MainBloc {
  final _staticDataRepository = StaticDataRepository();

  final _bottomTabIndex = StreamController<int>();
  Sink<int> get selectBottomTab => _bottomTabIndex.sink;
  Stream<int> get bottomTabIndex => _bottomTabIndex.stream;

  Stream<List<Menu>> get menus => _staticDataRepository.getMenus();
  Stream<List<Notice>> get notices => _staticDataRepository.getNotices();
  Stream<List<HomeBanner>> get banners => _staticDataRepository.getBanners();

  MainBloc();

  void dispose() {
    _bottomTabIndex.close();
  }
}
