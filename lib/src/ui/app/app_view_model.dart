import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum Page { HOME, SERCH, UPLOAD, REELS, MYPAGE }

class AppViewModel extends ChangeNotifier {
  final GlobalKey<NavigatorState> _key = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get key => _key;

  int _pageIndex = 0;

  bool _canPop = false;
  bool get canPop => _canPop;

  List<int> _history = [0];

  int get pageIndex => _pageIndex;

  void ChangePage(int value) {
    final _page = Page.values[value];
    switch (_page) {
      case Page.HOME:
      case Page.SERCH:
      case Page.UPLOAD:
      case Page.REELS:
      case Page.MYPAGE:
        changeIndex(_page.index);
    }
  }

  void changeIndex(int value) {
    if (_history.last != value) {
      _history.add(value);
    }
    print(_history);
    _pageIndex = value;
    notifyListeners();
  }

  void back(bool didPop) {
    if (_history.length > 1) {
      _history.removeLast();
      _pageIndex = _history.last;
      notifyListeners();
    } else {
      _canPop = true;
      notifyListeners();
    }
  }
}
