import 'dart:async';

import 'package:ramen/repositories/static_data_repository.dart';
import 'package:ramen/screens/shop_menu/menu.dart';

class MainBloc {
  final _staticDataRepository = StaticDataRepository();

  final _bottomTabIndex = StreamController<int>();
  Sink<int> get selectBottomTab => _bottomTabIndex.sink;
  Stream<int> get bottomTabIndex => _bottomTabIndex.stream;
  Stream<List<Menu>> get menus => _staticDataRepository.getMenus();

  MainBloc();

  void dispose() {
    _bottomTabIndex.close();
  }
}