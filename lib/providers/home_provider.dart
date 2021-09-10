import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeProvider extends ChangeNotifier {
  bool _isGridView = false;
  bool get isGridView => _isGridView;

  changeLayout() {
    _isGridView = !_isGridView;
    notifyListeners();
  }
}

final homeProvider = ChangeNotifierProvider((ref) => HomeProvider());
