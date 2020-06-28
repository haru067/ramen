import 'dart:async';

class MainBloc {
  final _bottomTabIndex = StreamController<int>();
  Sink<int> get selectBottomTab => _bottomTabIndex.sink;
  Stream<int> get bottomTabIndex => _bottomTabIndex.stream;

  MainBloc() {

  }

  void dispose() {
    _bottomTabIndex.close();
  }
}